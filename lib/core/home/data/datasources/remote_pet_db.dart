import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

import 'package:adoptini_app/core/home/data/models/pet_model.dart';

abstract class BaseRemotePetDB {
  Future<void> savePet(PetModel pet);
  Future<List<PetModel>> fetchPets();
}

@LazySingleton(as: BaseRemotePetDB)
class RemotePetDB implements BaseRemotePetDB {
  final FirebaseFirestore _firestore;
  final FirebaseStorage storage;

  RemotePetDB(this._firestore, this.storage);

  @override
  Future<void> savePet(PetModel pet) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('pet_images/${DateTime.now().toIso8601String()}}');
      final uploadTask = storageRef.putFile(File(pet.image));
      final downloadUrl = await (await uploadTask).ref.getDownloadURL();

      await _firestore.collection('pets').doc().set({
        'ownerId': pet.ownerId,
        'petId': pet.petId,
        'name': pet.name,
        'gender': pet.gender,
        'age': pet.age,
        'size': pet.size,
        'type': pet.type,
        'description': pet.description,
        'image': downloadUrl,
        'longitude': pet.longitude,
        'latitude': pet.latitude,
        'city': pet.city,
        'country': pet.country,
      });
    } catch (e) {
      throw Exception("Failed to save Pet");
    }
  }

  @override
  Future<List<PetModel>> fetchPets() async {
    try {
      final petsSnapshot = await FirebaseFirestore.instance.collection('pets').get();
      return petsSnapshot.docs
          .map((doc) => PetModel(
                name: doc.get('name'),
                age: doc.get('age'),
                description: doc.get('description'),
                gender: doc.get('gender'),
                size: doc.get('size'),
                image: doc.get('image'),
                latitude: doc.get('latitude'),
                longitude: doc.get('longitude'),
                ownerId: doc.get('ownerId'),
                petId: doc.get('petId'),
                type: doc.get('type'),
                city: doc.get('city'),
                country: doc.get('country'),
              ))
          .toList();
    } catch (e) {
      return [];
    }
  }
}
