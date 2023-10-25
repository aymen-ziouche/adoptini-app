import 'dart:async';

import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

abstract class BaseRemoteMessagesDB {
  Future<void> sendMsgAboutPet({required PetModel pet, required ConversationModel conversation});
  Future<void> sendMsg({required MessageModel message, required conversationId});
  Future<List<ConversationModel>> fetchConversations(String userId);
  Stream<List<MessageModel>> listenToMessages(String conversationId);
}

@LazySingleton(as: BaseRemoteMessagesDB)
class RemoteMessagesDB implements BaseRemoteMessagesDB {
  final FirebaseFirestore _firestore;

  RemoteMessagesDB(this._firestore);

  @override
  Future<void> sendMsgAboutPet({
    required PetModel pet,
    required ConversationModel conversation,
  }) async {
    final senderID = conversation.message.sender.uid;
    final recipientID = pet.owner.uid;

    final existingConversations = await _firestore.collection('Rooms').get();
    final List<String> participantIds = [];
    conversation.participants.map((value) {
      participantIds.add(value.uid);
    });

    for (var convo in existingConversations.docs) {
      final convoData = convo.data();
      final convoParticipants =
          (convoData['participants'] as List).map((p) => (p as Map)['uid'] as String).toList();
      if (convoParticipants.toSet().containsAll(participantIds.toSet())) {
        if (convoData['petId'] == pet.petId) {
          throw Exception('Conversation about this pet already exists between these participants');
        }
      }
    }

    final conversationDocRef = _firestore.collection("Rooms").doc();
    final conversationID = conversationDocRef.id;
    conversationDocRef.set({
      "conversationID": conversationID,
      "participants": conversation.participants.map((user) => user.toMap()).toList(),
      "petId": pet.petId,
    });

    final messageData = conversation.message.toMap();

    await conversationDocRef.collection('messages').add(messageData);

    await _firestore.collection('users').doc(senderID).update({
      'conversations': FieldValue.arrayUnion([conversationID]),
    });

    await _firestore.collection('users').doc(recipientID).update({
      'conversations': FieldValue.arrayUnion([conversationID]),
    });
  }

  @override
  Future<List<ConversationModel>> fetchConversations(String userId) async {
    final userDoc = await _firestore.collection('users').doc(userId).get();
    final conversationIds = List<String>.from(userDoc.data()!['conversations'] ?? []);

    final conversations = <ConversationModel>[];

    for (final conversationId in conversationIds) {
      final conversationDocRef = _firestore.collection("Rooms").doc(conversationId);
      final conversationDoc = await conversationDocRef.get();

      if (conversationDoc.exists) {
        final messageQuery =
            await conversationDocRef.collection('messages').orderBy('timestamp', descending: true).limit(1).get();

        final lastMessage =
            messageQuery.docs.isNotEmpty ? MessageModel.fromMap(messageQuery.docs.first.data()) : null;

        if (lastMessage != null) {
          final participantsData = List.from(conversationDoc.data()!['participants']);
          final participants = participantsData.map((participant) => UserModel.fromMap(participant)).toList();

          final conversationData = ConversationModel(
            id: conversationId,
            participants: participants,
            message: lastMessage,
          );
          conversations.add(conversationData);
        }
      }
    }
    return conversations;
  }

  @override
  Stream<List<MessageModel>> listenToMessages(String conversationId) {
    final conversationDocRef = _firestore.collection("Rooms").doc(conversationId);

    return conversationDocRef.collection('messages').orderBy('timestamp').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return MessageModel.fromMap(doc.data());
      }).toList();
    });
  }

  @override
  Future<void> sendMsg({required MessageModel message, required conversationId}) async {
    final conversationDocRef = _firestore.collection("Rooms").doc(conversationId);
    final messageData = message.toMap();
    await conversationDocRef.collection("messages").add(messageData);
  }
}
