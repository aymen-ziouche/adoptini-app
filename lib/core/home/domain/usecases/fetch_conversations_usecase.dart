import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_messages_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class FetchConversationsUsecase {
  final BaseMessagesRepo _messagesRepo;

  FetchConversationsUsecase(this._messagesRepo);

  Future<List<ConversationModel>> call(String userId) async {
    return await _messagesRepo.fetchConversations(userId);
  }
}
