package com.mustafakurt.anime_list.anime_list

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class AnimeMethodChannel(flutterEngine: FlutterEngine) {
    private val channel: MethodChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "com.mustafakurt.anime_list.anime_list/anime")

    init {
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "fetchAnimeList" -> {
                    val page = call.argument<Int>("page") ?: 1
                    channel.invokeMethod("fetchAnimeListResult", mapOf("page" to page))
                    result.success(null)
                }
                else -> result.notImplemented()
            }
        }
    }
}