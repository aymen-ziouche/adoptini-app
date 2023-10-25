
import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart';
import 'package:adoptini_app/utils/utils.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendMsgAboutPetUsecase {
  final BaseMessagesRepo _messagesRepo;

  SendMsgAboutPetUsecase(this._messagesRepo);

  Future<void> call(PetModel pet, UserModel currentUser, String message) async {
    final messageId = await generateRandomString(20);
    final sendMessage = MessageModel(
      messageId: messageId,
      sender: currentUser,
      content: message,
      timestamp: DateTime.now(),
    );
    final messageModel = ConversationModel(
      id: messageId,
      participants: [currentUser, pet.owner],
      message: sendMessage,
    );

    await _messagesRepo.sendMsgAboutPet(pet, messageModel);
  }
}

