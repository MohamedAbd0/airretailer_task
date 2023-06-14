import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class BaseAuthRemoteDataSource {
  Future<void> login({
    required String email,
    required String password,
  });
  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String gender,
  });
  Future<DocumentSnapshot> getUserByID({
    required String uid,
  });
}

class AuthRemoteDataSource extends BaseAuthRemoteDataSource {
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');

  @override
  Future<DocumentSnapshot> getUserByID({required String uid}) {
    return _users.doc(uid).get();
  }

  @override
  Future<void> login({required String email, required String password}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> register(
      {required String email,
      required String password,
      required String name,
      required String gender}) async {
    final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _users.doc(user.user?.uid).set({
      "name": name,
      "email": email,
      "gender": gender,
    });
  }
}
