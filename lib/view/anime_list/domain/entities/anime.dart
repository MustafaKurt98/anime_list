import 'package:equatable/equatable.dart';

class Anime extends Equatable {
  final int id;
  final String title;
  final String imageUrl;
  final double score;
  final String type;

  const Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.score,
    required this.type,
  });

  @override
  List<Object?> get props => [id, title, imageUrl, score];

  static fromJson(item) {}
}