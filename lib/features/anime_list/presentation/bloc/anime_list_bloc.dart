import 'package:anime_list/core/method_channel/anime_method_channel.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:anime_list/features/anime_list/domain/usecases/get_top_anime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnime getTopAnime;
  List<Anime> allAnimeList = [];
  int currentPage = 1;
  bool hasReachedMax = false;

  AnimeListBloc({required this.getTopAnime}) : super(AnimeListInitial()) {
    _setupMethodCallHandler();
    on<FetchAnimeList>(_onFetchAnimeList);
    on<LoadMoreAnime>(_onLoadMoreAnime);
    on<FilterAnimeList>(_onFilterAnimeList);
  }

  void _onFetchAnimeList(FetchAnimeList event, Emitter<AnimeListState> emit) async {
    emit(AnimeListLoading());
    currentPage = 1;
    hasReachedMax = false;
    allAnimeList.clear();
    await AnimeMethodChannel.fetchAnimeList(currentPage);
  }

 void _onLoadMoreAnime(LoadMoreAnime event, Emitter<AnimeListState> emit) async {
  if (!hasReachedMax && state is AnimeListLoaded) {
    final currentState = state as AnimeListLoaded;
    emit(currentState.copyWith(isLoadingMore: true));
    currentPage++;
    await AnimeMethodChannel.fetchAnimeList(currentPage);
  }
}

  void _onFilterAnimeList(FilterAnimeList event, Emitter<AnimeListState> emit) {
    if (state is AnimeListLoaded) {
      final currentState = state as AnimeListLoaded;
      if (event.selectedType.isEmpty || event.selectedType == 'All Anime') {
        emit(currentState.copyWith(
          animeList: allAnimeList,
          selectedType: 'All Anime',
        ));
      } else {
        final filteredList = allAnimeList
            .where((anime) => anime.type == event.selectedType)
            .toList();
        emit(currentState.copyWith(
          animeList: filteredList,
          selectedType: event.selectedType,
        ));
      }
    }
  }

  void _setupMethodCallHandler() {
    AnimeMethodChannel.setupMethodCallHandler((call) async {
      if (call.method == 'fetchAnimeListResult') {
        final failureOrAnimeList = await getTopAnime(Params(page: call.arguments['page']));
        failureOrAnimeList.fold(
          (failure) => emit(const AnimeListError(message: 'Failed to fetch anime list')),
          (newAnimeList) {
            if (newAnimeList.isEmpty) {
              hasReachedMax = true;
            } else {
              if (currentPage == 1) {
                allAnimeList = newAnimeList;
              } else {
                allAnimeList.addAll(newAnimeList);
              }
            }
            final currentState = state;
            if (currentState is AnimeListLoaded) {
              emit(currentState.copyWith(
                animeList: allAnimeList,
                hasReachedMax: hasReachedMax,
                isLoadingMore: false,
              ));
            } else {
              emit(AnimeListLoaded(
                animeList: allAnimeList,
                hasReachedMax: hasReachedMax,
                isLoadingMore: false,
              ));
            }
          },
        );
      }
      return;
    });
  }
}