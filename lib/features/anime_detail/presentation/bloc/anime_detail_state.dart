part of 'anime_detail_bloc.dart';

abstract class AnimeDetailState extends Equatable {
  const AnimeDetailState();
  
  @override
  List<Object> get props => [];
}

class AnimeDetailInitial extends AnimeDetailState {}

class AnimeDetailLoading extends AnimeDetailState {}

class AnimeDetailLoaded extends AnimeDetailState {
  final List<AnimeDetail> animeDetail;

  const AnimeDetailLoaded({required this.animeDetail});

  @override
  List<Object> get props => [animeDetail];
}

class AnimeDetailError extends AnimeDetailState {
  final String message;

  const AnimeDetailError({required this.message});

  @override
  List<Object> get props => [message];
}