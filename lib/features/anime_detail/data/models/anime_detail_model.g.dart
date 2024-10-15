// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeDetailModel _$AnimeDetailModelFromJson(Map<String, dynamic> json) =>
    AnimeDetailModel(
      id: json['character']['mal_id'] as int,
      title: json['character']['name'] as String,
      imageUrl: json['character']['images']['jpg']['image_url'] as String,
    );

Map<String, dynamic> _$AnimeDetailModelToJson(AnimeDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'imageUrl': instance.imageUrl,
    };
