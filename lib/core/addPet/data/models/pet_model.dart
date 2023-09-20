import 'package:adoptini_app/core/addPet/domain/entities/pet_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PetModel extends PetEntity {
  PetModel(
      {required super.size,
      required super.petId,
      required super.name,
      required super.age,
      required super.gender,
      required super.type,
      required super.image,
      required super.description,
      required super.ownerId,
      required super.city,
      required super.country,
      required super.latitude,
      required super.longitude});

  factory PetModel.fromFirestore(DocumentSnapshot snapshot) {
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    return PetModel(
      name: data['name'],
      city: data['city'],
      country: data['country'],
      age: data['age'],
      gender: data['gender'],
      description: data['description'],
      type: data['type'],
      image: data['image'],
      latitude: data['latitude'],
      longitude: data['longitude'],
      ownerId: data['ownerId'],
      petId: data["petId"],
      size: data["size"],
    );
  }
}
