part of 'anime_list_bloc.dart';

abstract class AnimeListState extends Equatable {
  const AnimeListState();
  
  @override
  List<Object> get props => [];
}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoading extends AnimeListState {}

class AnimeListLoaded extends AnimeListState {
  final List<Anime> animeList;

  const AnimeListLoaded({required this.animeList});

  @override
  List<Object> get props => [animeList];
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError({required this.message});

  @override
  List<Object> get props => [message];
}