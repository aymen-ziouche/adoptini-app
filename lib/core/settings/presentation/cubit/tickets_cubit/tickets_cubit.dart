


import 'package:adoptini_app/core/settings/domain/entities/ticket_entity.dart';
import 'package:adoptini_app/core/settings/domain/usecases/create_ticket_usecase.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tickets_state.dart';
part 'tickets_cubit.freezed.dart';

class TicketsCubit extends Cubit<TicketsState> {
  final CreateTicketUseCase createTicketUseCase;

  TicketsCubit(this.createTicketUseCase) : super(const TicketsState.initial());

  Future<void> createTicket(Ticket ticket) async {
    try {
      emit(const TicketsState.loading());
      await createTicketUseCase(ticket);
      emit(const TicketsState.loaded());
    } catch (e) {
      emit(
         TicketsState.error(
          errorMessage: LocaleKeys.error_creating_ticket.tr(),
        ),
      );
    }
  }
}
