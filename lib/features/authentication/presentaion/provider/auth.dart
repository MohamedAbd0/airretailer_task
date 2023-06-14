import 'package:airretailer_task/features/authentication/domain/usecases/login.dart';
import 'package:airretailer_task/features/authentication/domain/usecases/register.dart';
import 'package:airretailer_task/features/home/presentaion/view/screeen/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthController extends ChangeNotifier {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  AuthController(this.loginUseCase, this.registerUseCase);

  User? _user = FirebaseAuth.instance.currentUser;
  User? get user => _user;

  bool _loading = false;
  bool get loading => _loading;

  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    _loading = true;
    notifyListeners();
    final result = await loginUseCase(email: email, password: password);
    result.fold((failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.message),
        ),
      );

      return false;
    }, (user) {
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.name, (Route<dynamic> route) => false);
    });
    _loading = false;
    notifyListeners();
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    required String gender,
    required BuildContext context,
  }) async {
    _loading = true;
    notifyListeners();
    final result = await registerUseCase(
      email: email,
      password: password,
      name: name,
      gender: gender,
    );
    result.fold((failure) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(failure.message),
        ),
      );
    }, (user) {
      _user = FirebaseAuth.instance.currentUser;
      notifyListeners();
      Navigator.of(context).pushNamedAndRemoveUntil(
          HomeScreen.name, (Route<dynamic> route) => false);
    });
    _loading = false;
    notifyListeners();
  }
}
