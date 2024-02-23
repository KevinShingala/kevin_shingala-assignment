import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kevin_assignment/bindings/initialize_bindings.dart';
import 'package:kevin_assignment/firebase_options.dart';
import 'package:kevin_assignment/views/home_Screen.dart';
import 'package:kevin_assignment/views/splash_page.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  var firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: firebaseAuth.authStateChanges(),
      builder: (context, snapshot) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            initialBinding: InitialBindings(),
            theme: ThemeData(
              useMaterial3: false,
              primaryColor: Colors.white,
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  elevation: 0, foregroundColor: Colors.white),
              brightness: Brightness.light,
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w700, height: 1.2),
                headlineSmall: TextStyle(
                    fontSize: 16.0, fontWeight: FontWeight.w700, height: 1.2),
                headlineMedium: TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w400, height: 1.3),
                displaySmall: TextStyle(
                    fontSize: 20.0, fontWeight: FontWeight.w700, height: 1.3),
                displayMedium: TextStyle(
                    fontSize: 22.0, fontWeight: FontWeight.w700, height: 1.4),
                displayLarge: TextStyle(
                    fontSize: 24.0, fontWeight: FontWeight.w300, height: 1.4),
                titleSmall: TextStyle(
                    fontSize: 15.0, fontWeight: FontWeight.w600, height: 1.2),
                titleMedium: TextStyle(
                    fontSize: 13.0, fontWeight: FontWeight.w400, height: 1.2),
                bodyMedium: TextStyle(
                    fontSize: 13.0, fontWeight: FontWeight.w600, height: 1.2),
                bodyLarge: TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w400, height: 1.2),
                bodySmall: TextStyle(
                    fontSize: 12.0, fontWeight: FontWeight.w300, height: 1.2),
              ),
            ),
            navigatorKey: Get.key,
            defaultTransition: Transition.cupertino,
            home: snapshot.data == null ? const SplashPage() : HomeScreen());
      },
    );
  }
}
