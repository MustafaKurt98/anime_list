import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/view/anime_list/data/datasources/anime_remote_data_source.dart';
import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:anime_list/view/anime_list/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnimeRepository)
class AnimeRepositoryImpl implements AnimeRepository {
  final AnimeRemoteDataSource remoteDataSource;

  AnimeRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Anime>>> getTopAnime(int page) async {
    try {
      final remoteAnime = await remoteDataSource.getTopAnime(page);
      return Right(remoteAnime);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}