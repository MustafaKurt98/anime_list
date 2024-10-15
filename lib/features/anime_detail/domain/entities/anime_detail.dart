import 'package:equatable/equatable.dart';

class AnimeDetail extends Equatable {
  final int? id;
  final String? title;
  final String? imageUrl;

  const AnimeDetail({
    required this.id,
    required this.title,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [id, title, imageUrl];

  static fromJson(item) {}
}
