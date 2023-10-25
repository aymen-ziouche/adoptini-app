import 'dart:async';

import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/usecases/fetch_conversations_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/listen_to_messages_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/send_msg_about_pet_usercase.dart';
import 'package:adoptini_app/core/home/domain/usecases/send_msg_usecase.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_state.dart';
part 'messages_cubit.freezed.dart';

class MessagesCubit extends Cubit<MessagesState> {
  final SendMsgAboutPetUsecase _sendMsgAboutPetUsecase;
  final FetchConversationsUsecase _fetchConversationsUsecase;
  final MessagesUsecase _messagesUsecase;
  final SendMsgUsecase _sendMsgUsecase;

  MessagesCubit(
      this._sendMsgAboutPetUsecase, this._fetchConversationsUsecase, this._messagesUsecase, this._sendMsgUsecase)
      : super(MessagesState.initial());

  int unreadMessageCount = 0;

  Future<void> sendMsgAboutPet(PetModel pet, UserModel currentUser, String message) async {
    try {
      emit(const MessagesState.msgSending());
      await _sendMsgAboutPetUsecase.call(
        pet,
        currentUser,
        message,
      );
      emit(MessagesState.msgSent());
    } catch (e) {
      emit(MessagesState.error(errorMessage: e.toString()));
    }
  }

  Future<void> fetchConversations(String userId) async {
    try {
      emit(MessagesState.loading());

      final conversations = await _fetchConversationsUsecase.call(userId);

      emit(MessagesState.loadedConversations(conversations: conversations));
    } catch (e) {
      emit(MessagesState.error(errorMessage: e.toString()));
    }
  }

  Future<void> sendMsg(MessageModel message, String conversationId) async {
    try {
      await _sendMsgUsecase.call(message, conversationId);
    } catch (e) {
      emit(const MessagesState.error(errorMessage: "Failed to Send Message"));
    }
  }

  Stream<List<MessageModel>> listenToMessages(String conversationId) {
    _messagesUsecase.listenToMessages(conversationId).listen((event) {
      event.forEach((message) {
        if (!message.isRead) {
          unreadMessageCount++;
        }
      });
    });
    return _messagesUsecase.listenToMessages(conversationId);
  }

  Future<void> setMessagesAsRead(String conversationId, String messageId) async {
    try {
      // await _messagesUsecase.updateMessage(message);
    } catch (e) {
      emit(MessagesState.error(errorMessage: e.toString()));
    }
  }
}
