import 'dart:io';

import 'package:adoptini_app/core/addPet/data/models/pet_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

abstract class BaseRemotePetDB {
  // Future<PetModel> getCurrentUserData({required String id});
  Future<void> savePet({required PetModel pet});
}

@LazySingleton(as: BaseRemotePetDB)
class RemotePetDB implements BaseRemotePetDB {
  final FirebaseFirestore _firestore;
  final FirebaseStorage storage;

  String docId = FirebaseFirestore.instance.collection("pets").doc().id;

  RemotePetDB(
    this._firestore,
    this.storage,
  );
  @override
  Future<void> savePet({required PetModel pet}) async {
    try {
      final storageRef = FirebaseStorage.instance.ref().child('pet_images/${DateTime.now().toIso8601String()}}');
      final uploadTask = storageRef.putFile(File(pet.image));
      final downloadUrl = await (await uploadTask).ref.getDownloadURL();
      await _firestore.collection('pets').doc().set({
        'ownerId': pet.ownerId,
        'petId': docId,
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
}
