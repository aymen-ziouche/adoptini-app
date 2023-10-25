import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';

import 'package:adoptini_app/core/home/data/datasources/remote_pet_db.dart';
import 'package:adoptini_app/core/home/data/models/pet_model.dart';
import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
import 'package:adoptini_app/auth/data/datasources/location_service.dart';

@LazySingleton(as: BasePetRepo)
class PetRepo implements BasePetRepo {
  final BaseRemotePetDB remotePetDB;
  final BaseLocationService _locationService;
  
  

  PetRepo(this.remotePetDB, this._locationService);

  @override
  Future<void> savePet(String name, String age, String gender, String size, String type, String image,
      String description, UserModel owner) async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final lat = position.latitude;
      final lng = position.longitude;

      final locationData = await _locationService.getLocation();
      if (locationData.city.isNotEmpty) {
        final city = locationData.city;
        final country = locationData.country;
        await remotePetDB.savePet(name, age, gender, size, type, image, description, owner, city, country, lat, lng);
      }
    } catch (e) {
      throw Exception("Failed to save Pet");
    }
  }

  @override
  Future<List<PetModel>> fetchPets() {
    return remotePetDB.fetchPets();
  }
  
  @override
  Future<void> addPetToFavorites(PetModel pet, String uid) async {
    await remotePetDB.addPetToFavorites(pet, uid);
  }
  @override
  Future<void> removePetFromFavorites(pet, uid) async {
    await remotePetDB.removePetFromFavorites(pet, uid);
  }
  
  @override
  Future<List<PetModel>> fetchFavorites(String uid) async {
    return remotePetDB.fetchFavorites(uid);

  }
  
  @override
  Future<void> deletePet(pet) async {
    await remotePetDB.deletePet(pet);
  }
  
  
}
