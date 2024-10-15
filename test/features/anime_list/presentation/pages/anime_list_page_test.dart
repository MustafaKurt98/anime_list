import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:anime_list/features/anime_list/presentation/bloc/anime_list_bloc.dart';
import 'package:anime_list/features/anime_list/presentation/pages/anime_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_list_page_test.mocks.dart';

@GenerateMocks([AnimeListBloc])
void main() {
  late MockAnimeListBloc mockAnimeListBloc;

  setUp(() {
    mockAnimeListBloc = MockAnimeListBloc();
    getIt.registerFactory<AnimeListBloc>(() => mockAnimeListBloc);
  });

  tearDown(() {
    getIt.reset();
  });

  testWidgets('AnimeListPage should display loading indicator when initial state', (WidgetTester tester) async {
    when(mockAnimeListBloc.state).thenReturn(AnimeListInitial());

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AnimeListBloc>.value(
          value: mockAnimeListBloc,
          child: const AnimeListPage(),
        ),
      ),
    );

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('AnimeListPage should display anime list when loaded', (WidgetTester tester) async {
    final animeList = [
      const Anime(
        id: 1,
        title: 'Test Anime',
        imageUrl: 'test.jpg',
        score: 8.5,
        type: 'TV',
        synopsis: 'Test synopsis',
        genres: ['Action'],
        episodes: 12,
      ),
    ];

    when(mockAnimeListBloc.state).thenReturn(AnimeListLoaded(animeList: animeList, hasReachedMax: false));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AnimeListBloc>.value(
          value: mockAnimeListBloc,
          child: const AnimeListPage(),
        ),
      ),
    );

    expect(find.text('Test Anime'), findsOneWidget);
    expect(find.text('TV'), findsOneWidget);
    expect(find.byType(GridView), findsOneWidget);
  });

  testWidgets('AnimeListPage should display error message when error occurs', (WidgetTester tester) async {
    when(mockAnimeListBloc.state).thenReturn(const AnimeListError(message: 'Error occurred'));

    await tester.pumpWidget(
      MaterialApp(
        home: BlocProvider<AnimeListBloc>.value(
          value: mockAnimeListBloc,
          child: const AnimeListPage(),
        ),
      ),
    );

    expect(find.text('Error occurred'), findsOneWidget);
  });
}