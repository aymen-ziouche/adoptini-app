import 'dart:convert';
import 'dart:io';

import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

abstract class BaseRemotePetDB {
  Future<void> savePet(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner, String city, String country, double lat, double lng);
  Future<void> addPetToFavorites(PetModel pet, String uid);
  Future<void> removePetFromFavorites(PetModel pet, String uid);
  Future<void> deletePet(PetModel pet);
  Future<List<PetModel>> fetchPets();
  Future<List<PetModel>> fetchFavorites(String uid);
}

@LazySingleton(as: BaseRemotePetDB)
class RemotePetDB implements BaseRemotePetDB {
  final FirebaseFirestore _firestore;
  final FirebaseStorage storage;

  RemotePetDB(this._firestore, this.storage);

  @override
  Future<void> savePet(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner, String city, String country, double lat, double lng) async {
    final _dio = Dio();
    try {
      String petId = _firestore.collection("pets").doc().id;

      final pet = PetModel(
          size: size,
          petId: petId,
          name: name,
          age: age,
          gender: gender,
          type: type,
          image: image,
          description: description,
          owner: owner,
          city: city,
          country: country,
          latitude: lat,
          longitude: lng);

      final storageRef = storage.ref().child('pet_images/$petId');
      // final uploadImage = await File(image).readAsBytes();
      // final uploadTask = storageRef.putData(
      // uploadImage,
      // SettableMetadata(
      //  cacheControl: 'public, max-age=86400', // 86400-seconds = 1-day
      //  contentType: 'image/png',
      // ));
      final uploadTask = storageRef.putFile(File(image));
      final downloadUrl = await (await uploadTask).ref.getDownloadURL();
      final apiKey = dotenv.get("API_KEY");
      final apiSecret = dotenv.get("API_SECRET");
      final imageUrl = downloadUrl;
      final url = 'https://api.imagga.com/v2/tags?image_url=' + Uri.encodeComponent(imageUrl);

      _dio.options.headers['authorization'] = 'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));
      final response = await _dio.get(url);
      final tags = response.data['result']['tags'];
      final tagsToCheck = ['pets', 'dog', 'car', 'bird', 'animal'];
      final containsSpecifiedTag = tags.any((tag) {
        final tagName = tag['tag']['en'].toString().toLowerCase();
        return tagsToCheck.contains(tagName);
      });

      print(containsSpecifiedTag);
      print(response.data);
      if (containsSpecifiedTag) {
        await _firestore.collection('pets').doc(petId).set({
          'owner': pet.owner.toMap(),
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
      } else {
        storageRef.delete();
        throw Exception("Please Upload a clear image of your Pet");
      }
    } catch (e) {
      Sentry.captureException(e);
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
                owner: UserModel.fromMap(doc.get("owner")),
                petId: doc.get('petId'),
                type: doc.get('type'),
                city: doc.get('city'),
                country: doc.get('country'),
              ))
          .toList();
    } catch (e) {
      Sentry.captureException(e);
      return [];
    }
  }

  @override
  Future<void> addPetToFavorites(PetModel pet, String uid) async {
    try {
      final favoritesCollection = _firestore.collection("users").doc(uid).collection("Favorites").doc(pet.petId);

      await favoritesCollection.set({
        'petId': pet.petId,
      });
    } catch (e) {
      Sentry.captureException(e);
      throw Exception("Error adding pet to favorites");
    }
  }

  @override
  Future<void> removePetFromFavorites(pet, uid) async {
    try {
      final favoritePetDoc = _firestore.collection("users").doc(uid).collection("Favorites").doc(pet.petId);
      await favoritePetDoc.delete();
    } catch (e) {
      Sentry.captureException(e);
      throw Exception("Error removing pet from favorites");
    }
  }

  @override
  Future<List<PetModel>> fetchFavorites(String uid) async {
    try {
      final favoritesCollection = _firestore.collection("users").doc(uid).collection("Favorites");
      final favoritesQuerySnapshot = await favoritesCollection.get();
      final favoritePets = await Future.wait(favoritesQuerySnapshot.docs.map((doc) async {
        final data = doc.data();
        final petId = data['petId'] as String;
        final pet = await fetchPetById(petId);
        return pet;
      }));

      return favoritePets.where((pet) => pet != null).cast<PetModel>().toList();
    } catch (e) {
      print("Error fetching favorites: $e");
      Sentry.captureException(e);
      throw Exception("Error fetching favorites");
    }
  }

  Future<PetModel?> fetchPetById(String petId) async {
    try {
      final petDocument = await _firestore.collection("pets").doc(petId).get();
      if (petDocument.exists) {
        final pet = PetModel.fromFirestore(petDocument);
        return pet;
      } else {
        return null;
      }
    } catch (e) {
      Sentry.captureException(e);
      print("Error fetching pet by ID: $e");
      return null;
    }
  }

  @override
  Future<void> deletePet(PetModel pet) async {
    await _firestore.collection("pets").doc(pet.petId).delete();

    await deleteFavoritesByPetID(pet.petId);
  }

  Future<void> deleteFavoritesByPetID(String petID) async {
    final usersCollection = FirebaseFirestore.instance.collection("users");

    // Query all documents in the "users" collection
    final usersQuerySnapshot = await usersCollection.get();

    // Loop through each user document
    for (final userDoc in usersQuerySnapshot.docs) {
      final userRef = usersCollection.doc(userDoc.id);

      // Check if the user's "Favorites" sub-collection contains a document with the specified "PetID"
      final favoriteDocSnapshot = await userRef.collection("Favorites").doc(petID).get();
      if (favoriteDocSnapshot.exists) {
        // If the document exists, delete it
        await userRef.collection("Favorites").doc(petID).delete();
      }
    }
  }
}
