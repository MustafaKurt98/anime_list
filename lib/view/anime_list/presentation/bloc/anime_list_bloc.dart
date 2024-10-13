import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:anime_list/core/method_channel/anime_method_channel.dart';
import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:anime_list/view/anime_list/domain/usecases/get_top_anime.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnime getTopAnime;
  int currentPage = 1;

  AnimeListBloc({required this.getTopAnime}) : super(AnimeListInitial()) {
    _setupMethodCallHandler();
    on<FetchAnimeList>(_onFetchAnimeList);
    on<FilterAnimeList>(_onFilterAnimeList);
    on<LoadMoreAnime>(_onLoadMoreAnime);
  }

  void _onFetchAnimeList(FetchAnimeList event, Emitter<AnimeListState> emit) async {
    emit(AnimeListLoading(animeList: state.animeList));
    await AnimeMethodChannel.fetchAnimeList(event.page);
  }

  void _onFilterAnimeList(FilterAnimeList event, Emitter<AnimeListState> emit) {
    if (event.selectedType.isEmpty || event.selectedType == 'All Anime') {
      emit(AnimeListLoaded(animeList: state.animeList, hasReachedMax: state.hasReachedMax, selectedType: 'All Anime'));
    } else {
      final filteredList = state.animeList
          .where((anime) => anime.type == event.selectedType)
          .toList();
      emit(AnimeListLoaded(
          animeList: filteredList, hasReachedMax: state.hasReachedMax, selectedType: event.selectedType));
    }
  }

  void _onLoadMoreAnime(LoadMoreAnime event, Emitter<AnimeListState> emit) async {
    if (!state.isLoading && !state.hasReachedMax) {
      emit(AnimeListLoading(animeList: state.animeList));
      currentPage++;
      await AnimeMethodChannel.fetchAnimeList(currentPage);
    }
  }

  void _setupMethodCallHandler() {
    AnimeMethodChannel.setupMethodCallHandler((call) async {
      if (call.method == 'fetchAnimeListResult') {
        final failureOrAnimeList = await getTopAnime(Params(page: call.arguments['page']));
        failureOrAnimeList.fold(
          (failure) => emit(AnimeListError(message: 'Failed to fetch anime list', animeList: state.animeList)),
          (newAnimeList) {
            if (newAnimeList.isEmpty) {
              emit(AnimeListLoaded(animeList: state.animeList, hasReachedMax: true, selectedType: state.selectedType));
            } else {
              final updatedList = List<Anime>.from(state.animeList)..addAll(newAnimeList);
              emit(AnimeListLoaded(animeList: updatedList, hasReachedMax: false, selectedType: state.selectedType));
            }
          },
        );
      }
      return;
    });
  }
}