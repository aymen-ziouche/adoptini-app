import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/data/models/message_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/messages_cubit/messages_cubit.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:adoptini_app/utils/utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MessagesScreen extends StatefulWidget {
  final ConversationModel conversation;
  const MessagesScreen({required this.conversation, Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late MessagesCubit _messagesCubit;
  late UserCubit _userCubit;
  final _messageFieldController = TextEditingController();
  List<MessageModel> loadedMessages = [];
  List<MessageModel> reversedMessages = [];

  @override
  void initState() {
    _messagesCubit = context.read<MessagesCubit>();
    _userCubit = context.read<UserCubit>();
    _messagesCubit.listenToMessages(widget.conversation.id);

    _messagesCubit.setMessagesAsRead(widget.conversation.id, widget.conversation.message.messageId);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AdoptiniColors.backgroundColors,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
        title: Text(widget.conversation.message.sender.name.capitalize()),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<List<MessageModel>>(
              stream: _messagesCubit.listenToMessages(widget.conversation.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  loadedMessages = snapshot.data ?? [];
                  loadedMessages.sort((a, b) => a.timestamp.compareTo(b.timestamp));
                  reversedMessages = loadedMessages.reversed.toList();
                  return ListView.builder(
                    reverse: true,
                    itemCount: reversedMessages.length,
                    itemBuilder: (context, index) {
                      final message = reversedMessages[index];
                      final isCurrentUser = message.sender.uid == _userCubit.user!.uid;

                      return MessageItem(
                        message: message,
                        isCurrentUser: isCurrentUser,
                      );
                    },
                  );
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else {
                  return Center(
                    child: Text('No messages yet.'),
                  );
                }
              },
            ),
          ),
          Container(
            height: 50.h,
            decoration: BoxDecoration(
              color: AdoptiniColors.backgroundColors,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 20,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageFieldController,
                    decoration: InputDecoration(
                      hintText: 'Send a message',
                      hintStyle: TextStyle(color: AdoptiniColors.mainColor),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                    cursorColor: AdoptiniColors.mainColor,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    FontAwesomeIcons.paperPlane,
                    color: AdoptiniColors.mainColor,
                  ),
                  onPressed: () async {
                    final messageId = await generateRandomString(20);
                    final message = MessageModel(
                      messageId: messageId,
                      sender: _userCubit.user!,
                      content: _messageFieldController.text,
                      timestamp: DateTime.now(),
                    );
                    _messagesCubit.sendMsg(message, widget.conversation.id);
                    _messageFieldController.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final MessageModel message;
  final bool isCurrentUser;
  const MessageItem({required this.message, required this.isCurrentUser, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(18.0),
            decoration: new BoxDecoration(
                color: isCurrentUser ? Color(0xffE5E0C6) : Colors.grey,
                shape: BoxShape.rectangle,
                borderRadius: isCurrentUser
                    ? BorderRadius.only(
                        topRight: Radius.circular(150),
                        bottomLeft: Radius.circular(150),
                        topLeft: Radius.circular(150),
                      )
                    : BorderRadius.only(
                        topRight: Radius.circular(150),
                        bottomRight: Radius.circular(150),
                        topLeft: Radius.circular(150),
                      )),
            child: Container(
              constraints: BoxConstraints(maxWidth: 200.w),
              child: Text(
                message.content,
                style: GoogleFonts.leagueSpartan(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('hh:mm a').format(message.timestamp),
              style: GoogleFonts.leagueSpartan(
                fontSize: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
