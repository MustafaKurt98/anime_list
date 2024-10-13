import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel extends Anime {
  const AnimeModel({
    required int id,
    required String title,
    required String imageUrl,
    required double score,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          score: score,
        );

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        id: json['mal_id'] as int,
        title: json['title'] as String,
        imageUrl: json['images']['webp']['image_url'] as String,
        score: (json['score'] as num?)?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}