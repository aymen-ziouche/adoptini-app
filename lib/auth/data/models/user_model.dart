import 'package:adoptini_app/auth/domain/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:isar/isar.dart';
part 'user_model.g.dart';

@Collection()
class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.uid,
    required super.name,
    required super.email,
    required super.city,
    required super.country,
  });

  // Define a factory constructor to create UserModel instances from Firestore data.
  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      id: Isar.autoIncrement,
      uid: snapshot.id,
      name: data['name'],
      email: data['email'],
      city: data['city'],
      country: data['country'],
    );
  }
}
