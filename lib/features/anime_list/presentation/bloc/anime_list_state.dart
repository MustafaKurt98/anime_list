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
  final String selectedType;
  final bool hasReachedMax;
  final bool isLoadingMore;

  const AnimeListLoaded({
    required this.animeList,
    this.selectedType = 'All Anime',
    required this.hasReachedMax,
    this.isLoadingMore = false,
  });

  AnimeListLoaded copyWith({
    List<Anime>? animeList,
    String? selectedType,
    bool? hasReachedMax,
    bool? isLoadingMore,
  }) {
    return AnimeListLoaded(
      animeList: animeList ?? this.animeList,
      selectedType: selectedType ?? this.selectedType,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
    );
  }

  @override
  List<Object> get props => [animeList, selectedType, hasReachedMax, isLoadingMore];
}

class AnimeListError extends AnimeListState {
  final String message;

  const AnimeListError({required this.message});

  @override
  List<Object> get props => [message];
}