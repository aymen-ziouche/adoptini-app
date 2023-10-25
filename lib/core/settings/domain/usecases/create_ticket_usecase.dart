


import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';
import 'package:adoptini_app/core/settings/domain/repositories/base_ticket_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class CreateTicketUseCase {
  final BaseTicketsRepository repository;

  CreateTicketUseCase(this.repository,);

  Future<void> call(Ticket ticket) async {
    await repository.createTicket(ticket,);
  }
}
