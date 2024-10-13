// import 'package:bloc_state/core/error/failures.dart';
// import 'package:bloc_state/view/anime_list/domain/entities/anime.dart';
// import 'package:bloc_state/view/anime_list/domain/usecases/get_top_anime.dart';
// import 'package:bloc_state/view/anime_list/presentation/bloc/anime_list_bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mockito/annotations.dart';
// import 'package:mockito/mockito.dart';

// import 'anime_list_bloc_test.mocks.dart';

// @GenerateMocks([GetTopAnime])
// void main() {
//   late AnimeListBloc bloc;
//   late MockGetTopAnime mockGetTopAnime;

//   setUp(() {
//     mockGetTopAnime = MockGetTopAnime();
//     bloc = AnimeListBloc(getTopAnime: mockGetTopAnime);
//   });

//   test('initial state should be AnimeListInitial', () {
//     expect(bloc.state, equals(AnimeListInitial()));
//   });

//   group('FetchAnimeList', () {
//     final tAnimeList = [
//       const Anime(id: 1, title: 'Test Anime', imageUrl: 'test.jpg', score: 8.5),
//     ];
//     const tPage = 1;

//     test(
//       'should emit [AnimeListLoading, AnimeListLoaded] when data is gotten successfully',
//       () async {
//         // arrange
//         when(mockGetTopAnime(any))
//             .thenAnswer((_) async => Right(tAnimeList));
//         // assert later
//         final expected = [
//           AnimeListLoading(),
//           AnimeListLoaded(animeList: tAnimeList),
//         ];
//         expectLater(bloc.stream, emitsInOrder(expected));
//         // act
//         bloc.add(const FetchAnimeList(page: tPage));
//       },
//     );

//     test(
//       'should emit [AnimeListLoading, AnimeListError] when getting data fails',
//       () async {
//         // arrange
//         when(mockGetTopAnime(any))
//             .thenAnswer((_) async => Left(ServerFailure()));
//         // assert later
//         final expected = [
//           AnimeListLoading(),
//           const AnimeListError(message: 'Failed to fetch anime list'),
//         ];
//         expectLater(bloc.stream, emitsInOrder(expected));
//         // act
//         bloc.add(const FetchAnimeList(page: tPage));
//       },
//     );
//   });
// }