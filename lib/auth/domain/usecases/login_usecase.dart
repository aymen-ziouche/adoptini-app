import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUsecase {
  final BaseAuthRepo _authRepository;
  LoginUsecase(this._authRepository);

  Future<UserModel> call(String email, String password) async {
    return await _authRepository.login(email: email, password: password);
  }
}
