import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/features/anime_list/presentation/pages/anime_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
            elevation: 4,
            iconTheme: IconThemeData(color: Colors.black)),
      ),
      debugShowCheckedModeBanner: false,
      home: const AnimeListPage(),
    );
  }
}
