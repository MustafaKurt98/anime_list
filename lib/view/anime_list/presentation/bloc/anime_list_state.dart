part of 'anime_list_bloc.dart';

abstract class AnimeListState extends Equatable {
  final List<Anime> animeList;
  final bool isLoading;
  final bool hasReachedMax;
  final String selectedType;

  const AnimeListState({
    this.animeList = const [],
    this.isLoading = false,
    this.hasReachedMax = false,
    this.selectedType = 'All Anime',
  });
  
  @override
  List<Object> get props => [animeList, isLoading, hasReachedMax, selectedType];
}

class AnimeListInitial extends AnimeListState {}

class AnimeListLoading extends AnimeListState {
  const AnimeListLoading({required List<Anime> animeList}) 
      : super(animeList: animeList, isLoading: true);
}

class AnimeListLoaded extends AnimeListState {
  const AnimeListLoaded({
    required List<Anime> animeList,
    required bool hasReachedMax,
    String selectedType = 'All Anime',
  }) : super(
    animeList: animeList,
    hasReachedMax: hasReachedMax,
    selectedType: selectedType,
  );
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError({required this.message, required List<Anime> animeList})
      : super(animeList: animeList);

  @override
  List<Object> get props => [message, animeList];
}