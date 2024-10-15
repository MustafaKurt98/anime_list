// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeModel _$AnimeModelFromJson(Map<String, dynamic> json) => AnimeModel(
      id: json['mal_id'] as int,
      title: json['title'] as String,
      imageUrl: json['images']['webp']['image_url'] as String,
      score: (json['score'] as num?)?.toDouble() ?? 0.0,
      type: json['type'] as String,
      synopsis: json['synopsis'] as String,
      genres:
          (json['genres'] as List<dynamic>?)
                ?.map((e) => e['name'] as String)
                .toList() ??
            [],
      episodes: json['episodes'] as int?,
    );

Map<String, dynamic> _$AnimeModelToJson(AnimeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'image_url': instance.imageUrl,
      'score': instance.score,
      'type': instance.type,
      'synopsis': instance.synopsis,
      'genres': instance.genres,
      'episodes': instance.episodes,
    };
