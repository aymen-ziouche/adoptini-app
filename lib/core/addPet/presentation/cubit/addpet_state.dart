part of 'addpet_cubit.dart';

@freezed
class AddpetState with _$AddpetState {
  const factory AddpetState.initial() = _Initial;
  const factory AddpetState.loading() = _AddPetLoading;
  const factory AddpetState.loaded() = _AddPetLoaded;
  const factory AddpetState.error({required String errorMessage}) = _AddPetError;
}
