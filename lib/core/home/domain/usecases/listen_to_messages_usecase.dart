import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class MessagesUsecase {
  final BaseMessagesRepo _messagesRepo;

  MessagesUsecase(this._messagesRepo);
  Stream<List<MessageModel>>  listenToMessages(String conversationId) {
    return _messagesRepo.listenToMessages(conversationId);
  }
}
