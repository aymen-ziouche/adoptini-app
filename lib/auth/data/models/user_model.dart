import 'package:adoptini_app/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cloud_firestore;
import 'package:isar/isar.dart';
part 'user_model.g.dart';

@Collection()
class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.uid,
    required super.name,
    required super.email,
    required super.longitude,
    required super.latitude,
    required super.city,
    required super.country,
  });

  factory UserModel.fromFirestore(cloud_firestore.DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: Isar.autoIncrement,
      uid: data["uid"],
      name: data['name'],
      email: data['email'],
      city: data['city'],
      country: data['country'],
      longitude: data['longitude'],
      latitude: data['latitude'],
    );
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as int,
      uid: map['uid'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      city: map['city'] as String,
      country: map['country'] as String,
      longitude: (map['longitude'] as num).toDouble(),
      latitude: (map['latitude'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'uid': uid,
      'name': name,
      'email': email,
      'longitude': longitude,
      'latitude': latitude,
      'city': city,
      'country': country,
    };
  }

  UserModel edit({
    int? id,
    String? uid,
    String? name,
    String? email,
    double? longitude,
    double? latitude,
    String? city,
    String? country,
  }) {
    return UserModel(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      name: name ?? this.name,
      email: email ?? this.email,
      city: city ?? this.city,
      country: country ?? this.country,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
    );
  }

  static UserModel empty() {
    return UserModel(
      id: 0, // Set your default id here, or it can be null or any appropriate default value.
      uid: '', // Set your default uid here, or it can be an empty string.
      name: '', // Set your default name here, or it can be an empty string.
      email: '', // Set your default email here, or it can be an empty string.
      city: '', // Set your default city here, or it can be an empty string.
      country: '', // Set your default country here, or it can be an empty string.
      longitude: 0.0,
      latitude: 0.0,
    );
  }
}
