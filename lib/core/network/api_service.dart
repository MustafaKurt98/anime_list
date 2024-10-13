import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';

part 'api_service.chopper.dart';

@ChopperApi(baseUrl: 'https://api.jikan.moe/v4')
@injectable
abstract class ApiService extends ChopperService {
  @Get(path: '/top/anime')
  Future<Response> getTopAnime(@Query('page') int page);

  @Get(path: '/anime/{id}')
  Future<Response> getAnimeDetail(@Path('id') int id);

  @factoryMethod
  static ApiService create() {
    final client = ChopperClient(
      baseUrl: Uri.parse('https://api.jikan.moe/v4'),
      services: [
        _$ApiService(),
      ],
      converter: const JsonConverter(),
    );
    return _$ApiService(client);
  }
}