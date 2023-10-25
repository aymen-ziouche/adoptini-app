import 'package:adoptini_app/auth/presentation/cubit/user/user_cubit.dart';
import 'package:adoptini_app/common/adoptini_router.dart';
import 'package:adoptini_app/common/loading_screen.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/core/home/data/models/conversation_model.dart';
import 'package:adoptini_app/core/home/presentation/cubit/messages_cubit/messages_cubit.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:adoptini_app/utils/extensions.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ConversationsScreen extends StatefulWidget {
  const ConversationsScreen({Key? key}) : super(key: key);

  @override
  _ConversationsScreenState createState() => _ConversationsScreenState();
}

class _ConversationsScreenState extends State<ConversationsScreen> {
  late UserCubit _userCubit;

  @override
  void initState() {
    _userCubit = context.read<UserCubit>();
    context.read<MessagesCubit>().fetchConversations(_userCubit.user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AdoptiniColors.backgroundColors,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: BlocBuilder<MessagesCubit, MessagesState>(
        builder: (context, state) {
          return state.maybeWhen(loadedConversations: (conversations) {
            return SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 200.h,
                    color: Color(0xffB5B189),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100.h,
                        ),
                        Text(
                          LocaleKeys.messages.tr(),
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lemon(
                            color: Colors.black,
                            fontSize: 38,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 170.h,
                      ),
                      conversations.isNotEmpty
                          ? Container(
                              decoration: BoxDecoration(
                                  color: AdoptiniColors.backgroundColors,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50),
                                    topRight: Radius.circular(50),
                                  )),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  reverse: true,
                                  itemCount: conversations.length,
                                  itemBuilder: (context, index) {
                                    final conversation = conversations[index];

                                    return ConversationItem(
                                      isRead: conversation.message.isRead,
                                      conversation: conversation,
                                      onTap: () {
                                        Navigator.of(context)
                                            .pushNamed(AdoptiniRouter.conversationScreen, arguments: conversation);
                                      },
                                    );
                                  },
                                ),
                              ),
                            )
                          : Center(
                              child: Container(
                                alignment: Alignment.center,
                                height: 150.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: AdoptiniColors.backgroundColors,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(50),
                                      topRight: Radius.circular(50),
                                    )),
                                child: Text(
                                  LocaleKeys.no_messages.tr(),
                                  style: GoogleFonts.lemon(color: AdoptiniColors.mainColor, fontSize: 18),
                                ),
                              ),
                            )
                    ],
                  ),
                ],
              ),
            );
          }, error: (errorMessage) {
            return Center(child: Text(errorMessage));
          }, orElse: () {
            return LoadingScreen();
          });
        },
      ),
    );
  }
}

class ConversationItem extends StatelessWidget {
  final ConversationModel conversation;
  final VoidCallback onTap;
  final bool isRead;

  const ConversationItem({
    required this.conversation,
    required this.onTap,
    Key? key,
    required this.isRead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentUser = context.read<UserCubit>().user;
    final otherParticipant =
        conversation.participants.firstWhere((participant) => participant.id != currentUser?.uid);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        color: AdoptiniColors.backgroundColors,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
            SizedBox(
              width: 20.w,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    otherParticipant.name.capitalize(),
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 18,
                      fontWeight: isRead && conversation.message.sender.uid != currentUser?.uid
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Text(
                    conversation.message.content,
                    style: GoogleFonts.leagueSpartan(
                      fontSize: 18,
                      fontWeight: isRead && conversation.message.sender.uid != currentUser?.uid
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                    overflow: TextOverflow.fade,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
