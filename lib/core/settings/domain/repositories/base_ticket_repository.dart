

import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';

abstract class BaseTicketsRepository {
  Future<void> createTicket(Ticket ticket,);
}
