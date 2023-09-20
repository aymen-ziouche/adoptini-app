import 'package:injectable/injectable.dart';

import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';

@lazySingleton
class FetchPetUsecase {
  final BasePetRepo _petRepo;

  FetchPetUsecase(this._petRepo);

  Future<List<PetModel>> call() async {
    return _petRepo.fetchPets();
  }
}
