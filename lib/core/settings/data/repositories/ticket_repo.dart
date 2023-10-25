

import 'package:adoptini_app/core/settings/data/datasources/ticket_data_source.dart';
import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';
import 'package:adoptini_app/core/settings/domain/repositories/base_ticket_repository.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

@Injectable(as: BaseTicketsRepository)
class TicketsRepository extends BaseTicketsRepository {
  final TicketsDataSource ticketsDataSource;

  TicketsRepository(this.ticketsDataSource);

  @override
  Future<void> createTicket(Ticket ticket, ) async {
    try {
      await ticketsDataSource.createTicket(ticket);
    } catch (e) {
      Sentry.captureException(e);
      throw Exception(
        LocaleKeys.error_creating_ticket.tr(),
      );
    }
  }
}
