
import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class UpdateUserUsecase {
  final BaseAuthRepo _authRepository;
  UpdateUserUsecase(this._authRepository);

  Future<void> call(UserModel currentUser) async {
     await _authRepository.updateUser(currentUser: currentUser);
  }
}
