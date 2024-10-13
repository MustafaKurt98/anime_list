// import 'package:bloc_state/features/anime_list/domain/anime.dart';
// import 'package:bloc_state/features/anime_list/domain/repositories/anime_repository.dart';
// import 'package:bloc_state/features/anime_list/domain/usecases/get_top_anime.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'get_top_anime_test.mocks.dart';

// @GenerateMocks([AnimeRepository])
// void main() {
//   late GetTopAnime usecase;
//   late MockAnimeRepository mockAnimeRepository;

//   setUp(() {
//     mockAnimeRepository = MockAnimeRepository();
//     usecase = GetTopAnime(mockAnimeRepository);
//   });

//   final tPage = 1;
//   final tAnimeList = [
//     const Anime(id: 1, title: 'Test Anime', imageUrl: 'test.jpg', score: 8.5),
//   ];

//   test(
//     'should get top anime list from the repository',
//     () async {
//       // arrange
//       when(mockAnimeRepository.getTopAnime(any))
//           .thenAnswer((_) async => Right(tAnimeList));
//       // act
//       final result = await usecase(Params(page: tPage));
//       // assert
//       expect(result, Right(tAnimeList));
//       verify(mockAnimeRepository.getTopAnime(tPage));
//       verifyNoMoreInteractions(mockAnimeRepository);
//     },
//   );
// }