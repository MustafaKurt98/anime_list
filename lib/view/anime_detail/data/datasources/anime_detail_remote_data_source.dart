import 'dart:convert';

import 'package:anime_list/core/error/exceptions.dart';
import 'package:anime_list/core/network/api_service.dart';
import 'package:anime_list/view/anime_detail/data/models/anime_detail_model.dart';
import 'package:injectable/injectable.dart';

abstract class AnimeDetailRemoteDataSource {
  Future<AnimeDetailModel> getAnimeDetail(int id);
}

@Injectable(as: AnimeDetailRemoteDataSource)
class AnimeDetailRemoteDataSourceImpl implements AnimeDetailRemoteDataSource {
  final ApiService apiService;

  AnimeDetailRemoteDataSourceImpl(this.apiService);

  @override
  Future<AnimeDetailModel> getAnimeDetail(int id) async {
    try {
      final response = await apiService.getAnimeDetail(id);
      if (response.isSuccessful) {
        final Map<String, dynamic> jsonMap = json.decode(response.body);
        return AnimeDetailModel.fromJson(jsonMap['data']);
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
