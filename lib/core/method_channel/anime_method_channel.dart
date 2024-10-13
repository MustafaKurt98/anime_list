import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class AnimeMethodChannel {
  static const MethodChannel _channel = MethodChannel('com.mustafakurt.anime_list.anime_list/anime');

  static Future<void> fetchAnimeList(int page) async {
    try {
      await _channel.invokeMethod('fetchAnimeList', {'page': page});
    } on PlatformException catch (e) {
      debugPrint("Failed to fetch anime list: '${e.message}'.");
    }
  
  }

  static Future<void> setupMethodCallHandler(Function(MethodCall) handler) async {
    _channel.setMethodCallHandler(handler as Future Function(MethodCall call)?);
  }
}