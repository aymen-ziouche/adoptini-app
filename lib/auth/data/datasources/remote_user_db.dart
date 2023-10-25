import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class BaseRemoteUserDB {
  Future<UserModel> getCurrentUserData({required String id});
  Future<void> updateUserLocation({required String uid, required double lng, required double lat});
  Future<void> updateUser({required UserModel currentUser});
  Future<UserModel> saveUser({required UserModel user, required String password});
}

@LazySingleton(as: BaseRemoteUserDB)
class RemoteUserDB implements BaseRemoteUserDB {
  final FirebaseFirestore _firestore;
  final FirebaseAuth auth;

  RemoteUserDB(this._firestore, this.auth);

  @override
  Future<UserModel> getCurrentUserData({required String id}) async {
    final userDoc = await _firestore.collection('users').doc(id).get();
    if (userDoc.exists) {
      return UserModel.fromFirestore(userDoc);
    } else {
      throw Exception('User data not found');
    }
  }

  @override
  Future<UserModel> saveUser({required UserModel user, required String password}) async {
    try {
      final authResult = await auth.createUserWithEmailAndPassword(email: user.email, password: password);

      final userData = {
        'uid': authResult.user!.uid,
        'name': user.name,
        'email': user.email,
        'longitude': user.longitude,
        'latitude': user.latitude,
        'city': user.city,
        'country': user.country,
      };

      await _firestore.collection('users').doc(authResult.user!.uid).set(userData);

      // Retrieve the user data from Firestore after it has been saved
      final userDoc = await _firestore.collection('users').doc(authResult.user!.uid).get();
      return UserModel.fromFirestore(userDoc);
    } catch (e) {
      throw Exception("failed to save user");
    }
  }

  @override
  Future<void> updateUserLocation({required String uid, required double lng, required double lat}) async {
    _firestore.collection('users').doc(uid).update({
      "latitude": lat,
      "longitude": lng,
    });
  }

  @override
  Future<void> updateUser({required UserModel currentUser}) async {
    _firestore.collection("users").doc(currentUser.uid).update({
      "name": currentUser.name,
    });
  }
}
