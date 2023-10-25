import 'dart:io';

import 'package:adoptini_app/common/adoptini_dialog.dart';
import 'package:adoptini_app/common/enums.dart';
import 'package:adoptini_app/common/theme/adoptini_colors.dart';
import 'package:adoptini_app/common/theme/login_theme.dart';
import 'package:adoptini_app/common/theme/main_button.dart';
import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';
import 'package:adoptini_app/core/settings/presentation/cubit/tickets_cubit/tickets_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class TicketCreationForm extends StatefulWidget {
  const TicketCreationForm({super.key});

  @override
  State<TicketCreationForm> createState() => _TicketCreationFormState();
}

class _TicketCreationFormState extends State<TicketCreationForm> with TickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final _subjectController = TextEditingController();
  TicketType? _selectedType;
  final _messageController = TextEditingController();
  File? _attachment;
  late final AnimationController _animationController;
  late final TicketsCubit ticketsCubit;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 3000));
    ticketsCubit = context.read<TicketsCubit>();
  }

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TicketsCubit, TicketsState>(
      listener: (context, state) {
        state.whenOrNull(
          loading: () => AdoptiniDialog(context,
              mainButton: TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: LoginTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: "Adding Ticket",
              description: "Please Wait...",
              header: CircularProgressIndicator(
                color: Colors.white,
              )).show(),
          loaded: () {
            Navigator.of(context).pop();
            _subjectController.clear();
            _messageController.clear();
            AdoptiniDialog(
              context,
              mainButton: TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: LoginTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: "Your Ticket is Sent",
              description: "Your Ticket is sent and will be viewed",
              header: const Icon(
                FontAwesomeIcons.check,
                color: Colors.white,
              ),
            ).show();
          },
          error: (errorMessage) {
            Navigator.of(context).pop();
            AdoptiniDialog(
              context,
              mainButton: TextButton(
                style: const ButtonStyle(
                  splashFactory: NoSplash.splashFactory,
                  overlayColor: MaterialStatePropertyAll(Colors.transparent),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Close",
                  style: LoginTheme.bodyTextSmall
                      .copyWith(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14.sp),
                ),
              ),
              title: "An error has occurred",
              description: errorMessage,
              header: Lottie.asset(
                'assets/lotties/error.json',
                height: 50.h,
                width: 50.h,
                controller: _animationController,
                onLoaded: (composition) async {
                  _animationController
                    ..forward()
                    ..repeat();
                },
              ),
            ).show();
          },
        );
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _subjectController,
                      decoration: InputDecoration(
                        labelText: "Subject",
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Enter subject";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Theme(
                      data: Theme.of(context).copyWith(canvasColor: AdoptiniColors.backgroundColors),
                      child: DropdownButtonFormField<TicketType>(
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          labelText: "Type",
                          labelStyle: const TextStyle(color: Colors.black),
                        ),
                        validator: (value) {
                          if (value == null) {
                            return "Please select a type";
                          }
                          return null;
                        },
                        value: _selectedType,
                        items: TicketType.values.map((type) {
                          return DropdownMenuItem<TicketType>(
                            value: type,
                            child: Container(
                              constraints: const BoxConstraints(
                                minHeight: 48.0,
                              ),
                              color: Colors.transparent,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                type.toString().split(".").last.toUpperCase(),
                              ),
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedType = value;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    TextFormField(
                      style: const TextStyle(color: Colors.black),
                      controller: _messageController,
                      maxLines: 5,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter a message";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Message",
                        labelStyle: const TextStyle(color: Colors.black),
                        contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    InkWell(
                      onTap: () async {
                        final pickedFile = await ImagePicker().pickImage(
                          source: ImageSource.gallery,
                        );
                        if (pickedFile != null) {
                          setState(() {
                            _attachment = File(pickedFile.path);
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Please select an image",
                              ),
                            ),
                          );
                        }
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            FontAwesomeIcons.upload,
                            color: AdoptiniColors.mainColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Add an image",
                            style: const TextStyle(color: AdoptiniColors.mainColor, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                    MainButton(
                      text: "send",
                      onTap: () async {
                        if (_attachment == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Please upload an image"),
                            ),
                          );
                        } else if (_formKey.currentState!.validate() && _selectedType != null) {
                          final ticket = Ticket(
                            subject: _subjectController.text,
                            message: _messageController.text,
                            type: _selectedType!,
                            attachments: _attachment,
                          );
                          await ticketsCubit.createTicket(ticket);
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
