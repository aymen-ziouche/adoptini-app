import 'package:adoptini_app/core/addPet/domain/repositories/base_add_pet_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddPetUsecase {
  final BaseAddPetRepo _addPetRepo;

  AddPetUsecase(
    this._addPetRepo,
  );
  Future<void> call(
      String name, String age, String gender, String size, String type, String image, String description, String ownerId) async {
    await _addPetRepo.savePet(name, age, gender, size, type, image, description, ownerId);
  }
}
