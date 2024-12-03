
import 'package:birthtrack/admindashboard_page/admindashboard.dart';
import 'package:birthtrack/login_page.dart';
import 'package:birthtrack/register_page.dart';
import 'package:birthtrack/settings_page.dart';
import 'package:birthtrack/signup_page.dart';
import 'package:birthtrack/splash_screen.dart';
import 'package:birthtrack/userdashboardreusable/userdashboard_page.dart';


import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:logger/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  if (!kIsWeb) {
    await Firebase.initializeApp();
  } else {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: "AIzaSyC-HAEo8nO2lsNETDpW9ac_2uFSFleVcQ0",
          authDomain: "maghilum-flutter-bsit-3c.firebaseapp.com",
          projectId: "maghilum-flutter-bsit-3c",
          storageBucket: "maghilum-flutter-bsit-3c.firebasestorage.app",
          messagingSenderId: "635809748138",
          appId: "1:635809748138:web:29ad876ca99d202e3eacd3",
          measurementId: "G-LTJLMSV4B3"
        ),
      );
    } catch (e) {
      if (e.toString().contains('duplicate-app')) {
        // Firebase already initialized, ignore the error
      } else {
        Logger().e("Error initializing Firebase: $e");
        rethrow;
      }
    }
  }
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BirthTrack',
      home: LoginPage  (),
      // routes: {
      //   '/admin': (context) => AdminDashboardPage(),
      //   // ... other routes
      // },
    );
  }
}
