

import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchFavoritesUsecase {
  final BasePetRepo _petRepo;

  FetchFavoritesUsecase(this._petRepo);

  Future<List<PetModel>> call(String uid) async {
    return _petRepo.fetchFavorites(uid);
  }
}
