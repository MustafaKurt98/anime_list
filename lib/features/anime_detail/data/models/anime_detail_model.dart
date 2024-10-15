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
      _$AnimeDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeDetailModelToJson(this);
}
