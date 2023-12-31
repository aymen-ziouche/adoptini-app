import 'package:adoptini_app/auth/data/models/user_model.dart';

class PetEntity {
  final String petId;
  final String name;
  final String age;
  final String gender;
  final String size;
  final String type;
  final String image;
  final String description;
  final UserModel owner;
  final String city;
  final String country;
  final double latitude;
  final double longitude;

  PetEntity({
    required this.size,
    required this.petId,
    required this.name,
    required this.age,
    required this.gender,
    required this.type,
    required this.image,
    required this.description,
    required this.owner,
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude,
  });
}
