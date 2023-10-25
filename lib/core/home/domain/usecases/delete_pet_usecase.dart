

import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class DeletePetUsecase {
  final BasePetRepo _petRepo;

  DeletePetUsecase(this._petRepo);

  Future<void> call(PetModel pet,) async {
    await _petRepo.deletePet(pet);
  }
}