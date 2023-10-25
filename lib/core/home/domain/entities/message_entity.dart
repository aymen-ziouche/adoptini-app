
import 'package:adoptini_app/auth/data/models/user_model.dart';

class MessageEntity {
  final String messageId; // Unique identifier for the message
  final UserModel sender; // ID of the sender
  final String content; // Content of the message
  final DateTime timestamp; // Timestamp of when the message was sent

  MessageEntity({
    required this.messageId,
    required this.sender,
    required this.content,
    required this.timestamp,
  });
}