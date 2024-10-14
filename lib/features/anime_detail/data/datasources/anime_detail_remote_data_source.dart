import 'dart:convert';

import 'package:anime_list/core/error/exceptions.dart';
import 'package:anime_list/core/network/api_service.dart';
import 'package:anime_list/features/anime_detail/data/models/anime_detail_model.dart';
import 'package:injectable/injectable.dart';

abstract class AnimeDetailRemoteDataSource {
  Future<List<AnimeDetailModel>> getAnimeDetail(int id);
}

@Injectable(as: AnimeDetailRemoteDataSource)
class AnimeDetailRemoteDataSourceImpl implements AnimeDetailRemoteDataSource {
  final ApiService apiService;

  AnimeDetailRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<AnimeDetailModel>> getAnimeDetail(int id) async {
    try {
      final response = await apiService.getAnimeDetail(id);
      if (response.isSuccessful) {
         final Map<String, dynamic> jsonMap = response.body is String
            ? json.decode(response.body)
            : response.body;
        final List<dynamic> animeDetail = jsonMap['data'];
        return animeDetail
            .map((animeJson) => AnimeDetailModel.fromJson(animeJson))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      if (e is FormatException) {
        throw const FormatException('Invalid JSON format');
      } else {
        throw ServerException();
      }
    }
  }
}
