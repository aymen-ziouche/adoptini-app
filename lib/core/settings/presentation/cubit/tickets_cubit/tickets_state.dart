part of 'tickets_cubit.dart';

@freezed
class TicketsState with _$TicketsState {
  const factory TicketsState.initial() = _Initial;
  const factory TicketsState.loading() = _TicketLoading;
  const factory TicketsState.loaded() = _TicketLoaded;
  const factory TicketsState.error({required String errorMessage}) = _TicketError;
}
