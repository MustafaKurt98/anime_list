import 'package:equatable/equatable.dart';

class Anime extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final double score;
  final String type;
  final String synopsis;
  final List<String> genres;
  final int? episodes;

  const Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.type,
    required this.synopsis,
    required this.genres,
    required this.episodes,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, score, type, synopsis, genres, episodes];

  static fromJson(item) {}
}
