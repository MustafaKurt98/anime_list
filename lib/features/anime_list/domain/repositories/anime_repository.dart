import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeRepository {
  Future<Either<Failure, List<Anime>>> getTopAnime(int page);
}
