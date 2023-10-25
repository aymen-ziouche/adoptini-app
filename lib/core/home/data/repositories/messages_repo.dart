import 'package:adoptini_app/core/home/data/datasources/remote_messages_db.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaseMessagesRepo)
class MessagesRepo implements BaseMessagesRepo {
  final BaseRemoteMessagesDB remoteMessagesDB;

  MessagesRepo(this.remoteMessagesDB);

  @override
  Future<void> sendMsgAboutPet(PetModel pet, ConversationModel conversationModel) async {
    await remoteMessagesDB.sendMsgAboutPet(pet: pet, conversation: conversationModel);
  }

  @override
  Future<List<ConversationModel>> fetchConversations(String userId) async {
    return await remoteMessagesDB.fetchConversations(userId);
  }

  @override
  Stream<List<MessageModel>> listenToMessages(String conversationId) {
    return remoteMessagesDB.listenToMessages(conversationId);
  }

  @override
  Future<void> sendMsg(MessageModel message, String conversationId) async {
    await remoteMessagesDB.sendMsg(message: message, conversationId: conversationId);
  }
}
