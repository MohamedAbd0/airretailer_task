import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/services/services_locator.dart';
import 'features/authentication/presentaion/provider/auth.dart';
import 'features/authentication/presentaion/view/screeen/login_screen.dart';
import 'features/authentication/presentaion/view/screeen/signUp_screen.dart';
import 'features/home/presentaion/view/screeen/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServicesLocator().init();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthController>(
      create: (_) => sl<AuthController>(),
      child: Consumer<AuthController>(
        builder: (context, model, child) {
          return MaterialApp(
            title: 'Airretailer Task',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            initialRoute:
                model.user == null ? LoginScreen.name : HomeScreen.name,
            routes: {
              LoginScreen.name: (context) => LoginScreen(),
              RegisterScreen.name: (context) => RegisterScreen(),
              HomeScreen.name: (context) => const HomeScreen(),
            },
          );
        },
      ),
    );
  }
}
