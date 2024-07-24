import 'package:diet_app2/page/loading/loading_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Localizations Sample App',
      locale: Locale('ar'),
      fallbackLocale: Locale('ar'),
      home: LoadingScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
    );
  }
}
