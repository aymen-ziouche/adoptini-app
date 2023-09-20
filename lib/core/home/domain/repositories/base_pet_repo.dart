import 'package:adoptini_app/core/home/data/models/pet_model.dart';

abstract class BasePetRepo {
  Future<void> savePet(String name, String age, String gender, String size, String type, String image,
      String description, String ownerId);
  Future<List<PetModel>> fetchPets();
}
