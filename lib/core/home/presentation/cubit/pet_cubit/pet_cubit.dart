import 'dart:async';

import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/domain/usecases/add_pet_to_favorites_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/delete_pet_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/fetch_favorites_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/remove_pet_from_favorites_usecase.dart';
import 'package:adoptini_app/generated/locale_keys.g.dart';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:adoptini_app/core/home/domain/usecases/add_pet_usecase.dart';
import 'package:adoptini_app/core/home/domain/usecases/fetch_pet_usecase.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';

part 'pet_state.dart';
part 'pet_cubit.freezed.dart';

class PetCubit extends Cubit<PetState> {
  final AddPetUsecase addPetUsecase;
  final FetchPetUsecase fetchPetUseCase;
  final AddPetToFavoritesUsecase addToFavoritesUsecase;
  final FetchFavoritesUsecase fetchFavoritesUseCase;
  final RemovePetFromFavoritesUsecase removePetFromFavoritesUsecase;
  final DeletePetUsecase deletePetUsecase;

  List<PetModel> favoritePets = [];
  List<PetModel> fetchedPets = [];

  PetCubit(this.addPetUsecase, this.fetchPetUseCase, this.addToFavoritesUsecase, this.fetchFavoritesUseCase,
      this.removePetFromFavoritesUsecase, this.deletePetUsecase)
      : super(const PetState.initial());

  Future<void> addPet(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner) async {
    try {
      emit(const PetState.addPetloading());
      await addPetUsecase(name, age, gender, size, type, image, description, owner);
      emit(const PetState.addPetloaded());
    } catch (e) {
      emit(PetState.error(errorMessage: LocaleKeys.failed_to_add_pet.tr()));
    }
  }

  Future<List<PetModel>> fetchPets() async {
    try {
      emit(const PetState.petloading());
      final loadedPets = await fetchPetUseCase.call();
      for (var pet in loadedPets) {
        fetchedPets.add(pet);
      }
      emit(PetState.petloaded(loadedPets));
      return loadedPets;
    } catch (e) {
      emit(PetState.error(errorMessage: LocaleKeys.failed_to_load_pets.tr()));
      return [];
    }
  }

  Future<void> addPetToFavorites(PetModel pet, String uid) async {
    try {
      emit(const PetState.petloading());
      addToFavoritesUsecase.call(pet, uid);
      favoritePets.add(pet);
      emit(PetState.favoritesloaded(favoritePets));
    } catch (e) {
      emit(PetState.error(errorMessage: LocaleKeys.failed_to_add_pet_to_favorites.tr()));
    }
  }

  Future<void> removePetFromFavorites(PetModel pet, String uid) async {
    try {
      emit(const PetState.petloading());

      await removePetFromFavoritesUsecase.call(pet, uid);
      favoritePets.remove(pet);
      emit(PetState.favoritesloaded(favoritePets));
    } catch (e) {
      emit(PetState.error(errorMessage:  LocaleKeys.failed_to_remove_pet_from_favorites.tr()));
    }
  }

  Future<void> deletePet(
    PetModel pet,
  ) async {
    try {
      emit(const PetState.petloading());
      await deletePetUsecase.call(
        pet,
      );
      fetchedPets.remove(pet);
      emit(PetState.petloaded(fetchedPets));
    } catch (e) {
      emit(PetState.error(errorMessage: LocaleKeys.failed_to_delete_pet.tr()));
    }
  }

  Future<List<PetModel>> fetchFavorites(String uid) async {
    try {
      emit(const PetState.petloading());
      final favoritePets = await fetchFavoritesUseCase.call(uid);
      for (var pet in favoritePets) {
        print(
            "Favorite pet ===> ${pet.name} ${pet.age} ${pet.city} ${pet.country} ${pet.gender} ${pet.size} ${pet.type} ");
      }
      emit(PetState.favoritesloaded(favoritePets));
      return favoritePets;
    } catch (e) {
      emit(PetState.error(errorMessage: LocaleKeys.failed_to_load_pets.tr()));
      return [];
    }
  }
}
