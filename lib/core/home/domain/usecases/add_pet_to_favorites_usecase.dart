import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPetToFavoritesUsecase {
  final BasePetRepo _petRepo;

  AddPetToFavoritesUsecase(
    this._petRepo,
  );
  Future<void> call(PetModel pet, String uid) async {
    await _petRepo.addPetToFavorites(pet, uid);
  }
}
