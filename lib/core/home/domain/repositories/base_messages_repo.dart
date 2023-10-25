

import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';

abstract class BaseMessagesRepo {

 Future<void> sendMsgAboutPet(PetModel pet, ConversationModel message);
 Future<void> sendMsg(MessageModel message, String conversationId);
 Future<List<ConversationModel>> fetchConversations(String userId);
 Stream<List<MessageModel>> listenToMessages(String conversationId);
}
