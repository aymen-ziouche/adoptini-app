

import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LogoutUseCase {
  final BaseAuthRepo _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> call() async {
    return _authRepository.logout();
  }
}