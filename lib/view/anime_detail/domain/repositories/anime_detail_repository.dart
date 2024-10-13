import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/view/anime_detail/domain/entities/anime_detail.dart';
import 'package:dartz/dartz.dart';

abstract class AnimeDetailRepository {
  Future<Either<Failure, AnimeDetail>> getAnimeDetail(int id);
}