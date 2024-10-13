import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:anime_list/view/anime_list/domain/usecases/get_top_anime.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'anime_list_event.dart';
part 'anime_list_state.dart';

@injectable
class AnimeListBloc extends Bloc<AnimeListEvent, AnimeListState> {
  final GetTopAnime getTopAnime;

  AnimeListBloc({required this.getTopAnime}) : super(AnimeListInitial()) {
    on<FetchAnimeList>(_onFetchAnimeList);
  }

  void _onFetchAnimeList(FetchAnimeList event, Emitter<AnimeListState> emit) async {
    emit(AnimeListLoading());
    final failureOrAnimeList = await getTopAnime(Params(page: event.page));
    failureOrAnimeList.fold(
      (failure) => emit(const AnimeListError(message: 'Failed to fetch anime list')),
      (animeList) => emit(AnimeListLoaded(animeList: animeList)),
    );
  }
}