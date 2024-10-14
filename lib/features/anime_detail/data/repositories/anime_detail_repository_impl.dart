import 'package:anime_list/core/error/exceptions.dart';
import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_detail/data/datasources/anime_detail_remote_data_source.dart';
import 'package:anime_list/features/anime_detail/domain/entities/anime_detail.dart';
import 'package:anime_list/features/anime_detail/domain/repositories/anime_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AnimeDetailRepository)
class AnimeDetailRepositoryImpl implements AnimeDetailRepository {
  final AnimeDetailRemoteDataSource remoteDataSource;

  AnimeDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<AnimeDetail>>> getAnimeDetail(int id) async {
    try {
      final remoteAnimeDetail = await remoteDataSource.getAnimeDetail(id);
      return Right(remoteAnimeDetail);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
