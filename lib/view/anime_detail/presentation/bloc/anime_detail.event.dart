import 'package:equatable/equatable.dart';

abstract class AnimeDetailEvent extends Equatable {
  const AnimeDetailEvent();

  @override
  List<Object> get props => [];
}

class FetchAnimeDetail extends AnimeDetailEvent {
  final int id;

  const FetchAnimeDetail({required this.id});

  @override
  List<Object> get props => [id];
}