import 'package:adoptini_app/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract class BaseRemoteUserDB {
  Future<UserModel> getCurrentUserData({required String id});
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
      print(userDoc);
      return UserModel.fromFirestore(userDoc);
    } else {
      print("error here");
      throw Exception('User data not found');
    }
  }

  @override
  Future<UserModel> saveUser({required UserModel user, required String password}) async {
    try {
      final authResult = await auth.createUserWithEmailAndPassword(email: user.email, password: password);
      // Save the user's information on Firestore
      await _firestore.collection('users').doc(authResult.user!.uid).set({
        'name': user.name,
        'email': user.email,
        'city': user.city,
        'country': user.country,
      });
      print(authResult.user!.email);
      return user;
    } catch (e) {
      throw Exception("failed to save user");
    }
  }
}
