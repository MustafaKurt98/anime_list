import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_detail/domain/entities/anime_detail.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeDetailRepository {
  Future<Either<Failure, List<AnimeDetail>>> getAnimeDetail(int id);
}
