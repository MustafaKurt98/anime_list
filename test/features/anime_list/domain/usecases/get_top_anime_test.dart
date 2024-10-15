import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:anime_list/features/anime_list/domain/repositories/anime_repository.dart';
import 'package:anime_list/features/anime_list/domain/usecases/get_top_anime.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_top_anime_test.mocks.dart';

@GenerateMocks([AnimeRepository])
void main() {
  late GetTopAnime usecase;
  late MockAnimeRepository mockAnimeRepository;

  setUp(() {
    mockAnimeRepository = MockAnimeRepository();
    usecase = GetTopAnime(mockAnimeRepository);
  });

  const tPage = 1;
  final tAnimeList = [
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

  test(
    'should get top anime list from the repository',
    () async {
      // arrange
      when(mockAnimeRepository.getTopAnime(any))
          .thenAnswer((_) async => Right(tAnimeList));
      // act
      final result = await usecase(const Params(page: tPage));
      // assert
      expect(result, Right(tAnimeList));
      verify(mockAnimeRepository.getTopAnime(tPage));
      verifyNoMoreInteractions(mockAnimeRepository);
    },
  );

  test(
    'should return ServerFailure when repository fails',
    () async {
      // arrange
      when(mockAnimeRepository.getTopAnime(any))
          .thenAnswer((_) async => Left(ServerFailure()));
      // act
      final result = await usecase(const Params(page: tPage));
      // assert
      expect(result, Left(ServerFailure()));
      verify(mockAnimeRepository.getTopAnime(tPage));
      verifyNoMoreInteractions(mockAnimeRepository);
    },
  );
}