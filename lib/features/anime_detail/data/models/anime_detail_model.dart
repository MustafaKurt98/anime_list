import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/anime_detail.dart';

part 'anime_detail_model.g.dart';

@JsonSerializable()
class AnimeDetailModel extends AnimeDetail {
  const AnimeDetailModel({
    required int id,
    required String title,
    required String imageUrl,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
        );

  factory AnimeDetailModel.fromJson(Map<String, dynamic> json) =>
      AnimeDetailModel(
        id: json['character']['mal_id'] as int,
        title: json['character']['name'] as String,
        imageUrl: json['character']['images']['jpg']['image_url'] as String,
      );
  
  Map<String, dynamic> toJson() => _$AnimeDetailModelToJson(this);
}
