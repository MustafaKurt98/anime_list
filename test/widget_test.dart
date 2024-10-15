// // // This is a basic Flutter widget test.
// // //
// // // To perform an interaction with a widget in your test, use the WidgetTester
// // // utility in the flutter_test package. For example, you can send tap and scroll
// // // gestures. You can also use WidgetTester to find child widgets in the widget
// // // tree, read text, and verify that the values of widget properties are correct.

// // import 'package:flutter/material.dart';
// // import 'package:flutter_test/flutter_test.dart';

// // import 'package:anime_list/main.dart';

// // void main() {
// //   testWidgets('Counter increments smoke test', (WidgetTester tester) async {
// //     // Build our app and trigger a frame.
// //     await tester.pumpWidget(const MyApp());

// //     // Verify that our counter starts at 0.
// //     expect(find.text('0'), findsOneWidget);
// //     expect(find.text('1'), findsNothing);

// //     // Tap the '+' icon and trigger a frame.
// //     await tester.tap(find.byIcon(Icons.add));
// //     await tester.pump();

// //     // Verify that our counter has incremented.
// //     expect(find.text('0'), findsNothing);
// //     expect(find.text('1'), findsOneWidget);
// //   });
// // }


// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mockito/mockito.dart';
// import 'package:anime_list/features/anime_list/presentation/pages/anime_list_page.dart';
// import 'package:anime_list/features/anime_list/presentation/bloc/anime_list_bloc.dart';
// import 'package:anime_list/core/injection/injection.dart';

// class MockAnimeListBloc extends Mock implements AnimeListBloc {}

// void main() {
//   late MockAnimeListBloc mockAnimeListBloc;

//   setUp(() {
//     configureDependencies();
//     mockAnimeListBloc = MockAnimeListBloc();
//   });

//   testWidgets('AnimeListPage shows AppBar with correct title', (WidgetTester tester) async {
//     when(mockAnimeListBloc.state).thenReturn(AnimeListInitial());

//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AnimeListBloc>.value(
//           value: mockAnimeListBloc,
//           child: const AnimeListPage(),
//         ),
//       ),
//     );

//     expect(find.text('Top Anime'), findsOneWidget);
//   });

//   testWidgets('AnimeListPage shows loading indicator when state is AnimeListInitial', (WidgetTester tester) async {
//     when(mockAnimeListBloc.state).thenReturn(AnimeListInitial());

//     await tester.pumpWidget(
//       MaterialApp(
//         home: BlocProvider<AnimeListBloc>.value(
//           value: mockAnimeListBloc,
//           child: const AnimeListPage(),
//         ),
//       ),
//     );

//     expect(find.byType(CircularProgressIndicator), findsOneWidget);
//   });
// }