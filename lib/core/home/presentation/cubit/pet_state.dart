part of 'pet_cubit.dart';

@freezed
class PetState with _$PetState {
  const factory PetState.initial() = _Initial;
  const factory PetState.addPetloading() = _AddPetLoading;
  const factory PetState.petloading() = _PetLoading;
  const factory PetState.addPetloaded() = _AddPetLoaded;
  const factory PetState.petloaded(List<PetModel> loadedpets) = _PetLoaded;
  const factory PetState.error({required String errorMessage}) = _Error;
}