import 'package:equatable/equatable.dart';

class AnimeDetail extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final double score;
  final List<String> genres;
  final String synopsis;
  final int episodesCount;

  const AnimeDetail({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.genres,
    required this.synopsis,
    required this.episodesCount,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, score, genres, synopsis, episodesCount];
}