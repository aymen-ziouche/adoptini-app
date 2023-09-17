import 'package:adoptini_app/auth/data/models/location_data.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

abstract class BaseLocationService {
  Future<LocationData> getLocation();
}

@LazySingleton(as: BaseLocationService)
class LocationService implements BaseLocationService {
  @override
  Future<LocationData> getLocation() async {
    final dio = Dio();
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final lat = position.latitude;
      final lng = position.longitude;
      final response = await dio.get(
          'http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lng&appid=2754c0a345aa1a5bc62b0fd31357089b');

      if (response.statusCode == 200) {
        if (response.data != null) {
          String city = response.data[0]['state'];
          String country = response.data[0]['country'];
          city = city;
          country = country;
          return LocationData(city, country);
        }
        throw Exception('Location data not found');
      } else {
        throw Exception('Failed to fetch location data');
      }
    } catch (e) {
      throw Exception('Error getting location: $e');
    }
  }
}
