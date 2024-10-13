import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/view/anime_list/presentation/pages/anime_list_page.dart';
import 'package:flutter/material.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimeListPage(),
    );
  }
}
