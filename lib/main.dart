import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/features/anime_list/presentation/pages/anime_list_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterFatalError;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black,
              elevation: 4,
              iconTheme: IconThemeData(color: Colors.white)),
          scaffoldBackgroundColor: Colors.black),
      debugShowCheckedModeBanner: false,
      home: const AnimeListPage(),
    );
  }
}
