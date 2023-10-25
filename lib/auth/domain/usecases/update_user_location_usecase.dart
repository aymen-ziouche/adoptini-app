import 'package:adoptini_app/auth/domain/repositories/base_auth_repo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateUserLocationUsecase {
  final BaseAuthRepo _authRepository;

  UpdateUserLocationUsecase(
    this._authRepository,
  );

  Future<void> call(String uid) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied, we cannot request permissions.');
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final lat = position.latitude;
    final lng = position.longitude;

    await _authRepository.updateUserLocation(uid: uid, lng: lng, lat: lat);
  }
}
