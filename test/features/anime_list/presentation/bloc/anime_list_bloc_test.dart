import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:anime_list/features/anime_list/domain/usecases/get_top_anime.dart';
import 'package:anime_list/features/anime_list/presentation/bloc/anime_list_bloc.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:anime_list/core/error/failures.dart';

import 'anime_list_bloc_test.mocks.dart';

@GenerateMocks([GetTopAnime])
void main() {
  late AnimeListBloc bloc;
  late MockGetTopAnime mockGetTopAnime;

  setUp(() {
    mockGetTopAnime = MockGetTopAnime();
    bloc = AnimeListBloc(getTopAnime: mockGetTopAnime);
  });

  tearDown(() {
    bloc.close();
  });

  test('initial state should be AnimeListInitial', () {
    expect(bloc.state, equals(AnimeListInitial()));
  });

  group('FetchAnimeList', () {
    final tAnimeList = [
      const Anime(id: 1, title: 'Test Anime', imageUrl: 'test.jpg', score: 8.5, type: 'TV', synopsis: 'Test', genres: [], episodes: 12),
    ];

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListLoaded] when FetchAnimeList is added and successful',
      build: () {
        when(mockGetTopAnime(any))
            .thenAnswer((_) async => Right(tAnimeList));
        return bloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeList(page: 1)),
      expect: () => [
        AnimeListLoading(),
        AnimeListLoaded(animeList: tAnimeList, hasReachedMax: false),
      ],
    );

    blocTest<AnimeListBloc, AnimeListState>(
      'emits [AnimeListLoading, AnimeListError] when FetchAnimeList is added and unsuccessful',
      build: () {
        when(mockGetTopAnime(any))
            .thenAnswer((_) async => Left(ServerFailure()));
        return bloc;
      },
      act: (bloc) => bloc.add(const FetchAnimeList(page: 1)),
      expect: () => [
        AnimeListLoading(),
        const AnimeListError(message: 'Server Failure'),
      ],
    );
  });
}