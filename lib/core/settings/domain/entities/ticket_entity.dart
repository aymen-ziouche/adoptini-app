

import 'dart:io';

import 'package:adoptini_app/common/enums.dart';

class Ticket {
  final String subject;
  final TicketType type;
  final String message;
  final File? attachments;

  Ticket({
    required this.subject,
    required this.type,
    required this.message,
    required this.attachments,
  });
}
