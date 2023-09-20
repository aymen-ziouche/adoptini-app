import 'package:adoptini_app/auth/data/datasources/location_service.dart';
import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

@Injectable()
class RegisterUsecase {
  final BaseAuthRepo _authRepository;
  final BaseLocationService _locationService;

  RegisterUsecase(this._authRepository, this._locationService);
  Future<UserModel> call(String name, String email, String password) async {
    final locationData = await _locationService.getLocation();

    if (locationData.city.isNotEmpty) {
      final city = locationData.city;
      final country = locationData.country;

      const uid = Isar.autoIncrement;

      final userModel = UserModel(
        id: uid,
        uid: uid.toString(),
        name: name,
        email: email,
        city: city,
        country: country,
      );
      await _authRepository.registerUser(user: userModel, password: password);

      return userModel;
    } else {
      throw Exception('Failed to save user ');
    }
  }
}
