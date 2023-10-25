import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';

abstract class BasePetRepo {
  Future<void> savePet(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner);
  Future<List<PetModel>> fetchPets();
  Future<void> addPetToFavorites(PetModel pet, String uid);
  Future<void> removePetFromFavorites(pet, uid);
  Future<void> deletePet(pet,);
  Future<List<PetModel>> fetchFavorites(String uid);
}
