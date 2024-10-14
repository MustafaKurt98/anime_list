import 'package:anime_list/features/anime_detail/domain/entities/anime_detail.dart';
import 'package:json_annotation/json_annotation.dart';

part 'anime_detail_model.g.dart';

@JsonSerializable()
class AnimeDetailModel extends AnimeDetail {
  const AnimeDetailModel({
    required int id,
    required String title,
    required String imageUrl,
    required double score,
    required List<String> genres,
    required String synopsis,
    required int episodesCount,
  }) : super(
          id: id,
          title: title,
          imageUrl: imageUrl,
          score: score,
          genres: genres,
          synopsis: synopsis,
          episodesCount: episodesCount,
        );

  factory AnimeDetailModel.fromJson(Map<String, dynamic> json) =>
      _$AnimeDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$AnimeDetailModelToJson(this);
}
