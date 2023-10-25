import 'package:isar/isar.dart';

class UserEntity {
  final Id id;
  final String uid;
  final String name;
  final String email;
  final double longitude;
  final double latitude;
  final String city;
  final String country;

  const UserEntity({
    required this.id,
    required this.uid,
    required this.name,
    required this.email,
    required this.longitude,
    required this.latitude,
    required this.city,
    required this.country,
  });
}
