import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:adoptini_app/core/home/domain/usecases/add_pet_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/fetch_pet_usecase.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';

part 'pet_state.dart';
part 'pet_cubit.freezed.dart';

class PetCubit extends Cubit<PetState> {
  final AddPetUsecase addPetUsecase;
  final FetchPetUsecase fetchPetUseCase;

  PetCubit(this.addPetUsecase, this.fetchPetUseCase) : super(const PetState.initial());

  Future<void> addPet(String name, String age, String gender, String size, String type, String image,
      String description, String ownerId) async {
    try {
      emit(const PetState.addPetloading());
      await addPetUsecase(name, age, gender, size, type, image, description, ownerId);
      emit(const PetState.addPetloaded());
    } catch (e) {
      emit(const PetState.error(errorMessage: "Failed to add pet"));
    }
  }

  Future<List<PetModel>> fetchPets() async {
    try {
      emit(const PetState.petloading());
      final loadedPets = await fetchPetUseCase.call();
      for (var pet in loadedPets) {
        print(
            "Loaded pet ===> ${pet.name} ${pet.age} ${pet.city} ${pet.country} ${pet.gender} ${pet.size} ${pet.type} ");
      }
      emit(PetState.petloaded(loadedPets));
      return loadedPets;
    } catch (e) {
      emit(const PetState.error(errorMessage: "Failed to Load pet"));
      return [];
    }
  }
}
