part of 'messages_cubit.dart';

@freezed
class MessagesState with _$MessagesState {
  const factory MessagesState.initial() = _Initial;
  const factory MessagesState.loading() = _Loading;
  const factory MessagesState.loadedConversations({required List<ConversationModel> conversations}) = _LoadedConversations;
  const factory MessagesState.msgSending() = _MsgSending;
  const factory MessagesState.msgSent() = _MsgSent;
  const factory MessagesState.messageLoaded({required List<MessageModel> messages }) = _MessageLoaded;
  const factory MessagesState.error({required String errorMessage}) = _Error;
}
