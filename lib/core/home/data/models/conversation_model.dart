import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';

class ConversationModel {
  final String id;
  final List<UserModel> participants;
  final MessageModel message;

  ConversationModel({
    required this.id,
    required this.participants,
    required this.message,
  });

}
