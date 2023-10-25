

import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendMsgUsecase {
  final BaseMessagesRepo _messagesRepo;

  SendMsgUsecase(this._messagesRepo);

  Future<void> call(MessageModel message, String conversationId) async {

    await _messagesRepo.sendMsg(message, conversationId);
  }
}