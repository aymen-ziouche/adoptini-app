import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/domain/entities/message_entity.dart';

class MessageModel extends MessageEntity {
  late final bool isRead;

  MessageModel({
    required String messageId,
    required UserModel sender,
    required String content,
    required DateTime timestamp,
    this.isRead = false,
  }) : super(
          messageId: messageId,
          sender: sender,
          content: content,
          timestamp: timestamp,
        );

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      messageId: map['messageId'],
      // sender: map['sender'],
      sender: UserModel.fromMap(map["sender"]),
      content: map['content'],
      timestamp: map['timestamp'].toDate(),
      isRead: map['isRead'] ?? false,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'messageId': messageId,
      'sender': sender.toMap(),
      'content': content,
      'timestamp': timestamp,
      'isRead': isRead,
    };
  }
}
