import 'dart:convert';

import 'package:anime_list/core/error/exceptions.dart';
import 'package:anime_list/core/network/api_service.dart';
import 'package:anime_list/view/anime_list/data/models/anime_model.dart';
import 'package:injectable/injectable.dart';

abstract class AnimeRemoteDataSource {
  Future<List<AnimeModel>> getTopAnime(int page);
}

@Injectable(as: AnimeRemoteDataSource)
class AnimeRemoteDataSourceImpl implements AnimeRemoteDataSource {
  final ApiService apiService;

  AnimeRemoteDataSourceImpl(this.apiService);

  @override
  Future<List<AnimeModel>> getTopAnime(int page) async {
    try {
      final response = await apiService.getTopAnime(page);

      if (response.isSuccessful) {
        final Map<String, dynamic> jsonMap = response.body is String
            ? json.decode(response.body)
            : response.body;
        final List<dynamic> animeList = jsonMap['data'];
        return animeList
            .map((animeJson) => AnimeModel.fromJson(animeJson))
            .toList();
      } else {
        throw ServerException();
      }
    } catch (e) {
      throw ServerException();
    }
  }
}
