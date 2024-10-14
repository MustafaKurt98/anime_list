import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_model.g.dart';

@JsonSerializable()
class AnimeModel extends Anime {
  const AnimeModel({
    required int id,
    required String title,
    required String imageUrl,
    required double score,
    required String type,
    required String synopsis,
    required List<String> genres,
    required int? episodes,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          score: score,
          type: type,
          synopsis: synopsis,
          genres: genres,
          episodes: episodes,
        );

  factory AnimeModel.fromJson(Map<String, dynamic> json) => AnimeModel(
        id: json['mal_id'] as int,
        title: json['title'] as String,
        imageUrl: json['images']['webp']['image_url'] as String,
        score: (json['score'] as num?)?.toDouble() ?? 0.0,
        type: json['type'] as String,
        synopsis: json['synopsis'] as String,
        genres: (json['genres'] as List<dynamic>?)
                ?.map((e) => e['name'] as String)
                .toList() ??
            [],
        episodes: json['episodes'] as int?,
      );

  Map<String, dynamic> toJson() => _$AnimeModelToJson(this);
}
