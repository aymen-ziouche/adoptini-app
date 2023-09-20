// import 'package:adoptini_app/auth/data/datasources/location_service.dart';
// import 'package:adoptini_app/core/home/data/datasources/remote_pet_db.dart';
// import 'package:adoptini_app/core/home/data/models/pet_model.dart';
// import 'package:adoptini_app/core/home/domain/repositories/base_pet_repo.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton(as: BasePetRepo)
// class PetRepo implements BasePetRepo {
//   final BaseRemotePetDB remotePetDB;

//   final BaseLocationService _locationService;

//   PetRepo(
//     this.remotePetDB,
//     this._locationService,
//   );
//   @override
//   Future<void> savePet(String name, String age, String gender, String size, String type, String image,
//       String description, String ownerId) async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );

//       final lat = position.latitude;
//       final lng = position.longitude;

//       final locationData = await _locationService.getLocation();

//       if (locationData.city.isNotEmpty) {
//         final city = locationData.city;
//         final country = locationData.country;
//         final petModel = PetModel(
//             size: size,
//             petId: "",
//             name: name,
//             age: age,
//             gender: gender,
//             type: type,
//             image: image,
//             description: description,
//             ownerId: ownerId,
//             city: city,
//             country: country,
//             latitude: lat,
//             longitude: lng);

//         await remotePetDB.savePet(pet: petModel);
//       }
//     } catch (e) {
//       throw Exception();
//     }
//   }
  
//   @override
//   Future<List<PetModel>> fetchPets() {
//     return remotePetDB.fetchPets();
//   }
// }

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
      String description, String ownerId) async {
    try {
      final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      final lat = position.latitude;
      final lng = position.longitude;

      final locationData = await _locationService.getLocation();
      if (locationData.city.isNotEmpty) {
        final city = locationData.city;
        final country = locationData.country;
                final petModel = PetModel(
            size: size,
            petId: "",
            name: name,
            age: age,
            gender: gender,
            type: type,
            image: image,
            description: description,
            ownerId: ownerId,
            city: city,
            country: country,
            latitude: lat,
            longitude: lng);

        await remotePetDB.savePet(petModel);
      }
    } catch (e) {
      throw Exception("Failed to save Pet");
    }
  }

  @override
  Future<List<PetModel>> fetchPets() {
    return remotePetDB.fetchPets();
  }
}
