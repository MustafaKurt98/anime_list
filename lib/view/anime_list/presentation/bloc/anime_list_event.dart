part of 'anime_list_bloc.dart';

abstract class AnimeListEvent extends Equatable {
  const AnimeListEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeList extends AnimeListEvent {
  final int page;

  const FetchAnimeList({required this.page});

  @override
  List<Object> get props => [page];
}