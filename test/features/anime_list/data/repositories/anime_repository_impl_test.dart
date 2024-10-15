import 'package:anime_list/core/error/exceptions.dart';
import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_list/data/datasources/anime_remote_data_source.dart';
import 'package:anime_list/features/anime_list/data/models/anime_model.dart';
import 'package:anime_list/features/anime_list/data/repositories/anime_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'anime_repository_impl_test.mocks.dart';

@GenerateMocks([AnimeRemoteDataSource])
void main() {
  late AnimeRepositoryImpl repository;
  late MockAnimeRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockAnimeRemoteDataSource();
    repository = AnimeRepositoryImpl(mockRemoteDataSource);
  });

  const tPage = 1;
  final tAnimeModelList = [
    const AnimeModel(
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
    'should return remote data when the call to remote data source is successful',
    () async {
      // arrange
      when(mockRemoteDataSource.getTopAnime(any))
          .thenAnswer((_) async => tAnimeModelList);
      // act
      final result = await repository.getTopAnime(tPage);
      // assert
      verify(mockRemoteDataSource.getTopAnime(tPage));
      expect(result, equals(Right(tAnimeModelList)));
    },
  );

  test(
    'should return server failure when the call to remote data source is unsuccessful',
    () async {
      // arrange
      when(mockRemoteDataSource.getTopAnime(any)).thenThrow(ServerException());
      // act
      final result = await repository.getTopAnime(tPage);
      // assert
      verify(mockRemoteDataSource.getTopAnime(tPage));
      expect(result, equals(Left(ServerFailure())));
    },
  );
}