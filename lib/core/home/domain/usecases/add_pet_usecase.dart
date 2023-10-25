import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPetUsecase {
  final BasePetRepo _petRepo;

  AddPetUsecase(
    this._petRepo,
  );
  Future<void> call(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner) async {
    await _petRepo.savePet(name, age, gender, size, type, image, description, owner);
  }
}
