import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class StartAppUsecase {
  final BaseAuthRepo _authRepository;

  StartAppUsecase(
    this._authRepository,
  );

  Future<UserModel?> call() async {
  
      final user = await _authRepository.getUserData();
      if (user == null) return null;
      return user;
   
  }
}
