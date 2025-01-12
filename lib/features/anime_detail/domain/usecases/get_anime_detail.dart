import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/features/anime_detail/domain/entities/anime_detail.dart';
import 'package:anime_list/features/anime_detail/domain/repositories/anime_detail_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetAnimeDetail {
  final AnimeDetailRepository repository;

  GetAnimeDetail(this.repository);

  Future<Either<Failure, List<AnimeDetail>>> call(Params params) async {
    return await repository.getAnimeDetail(params.id);
  }
}

class Params extends Equatable {
  final int id;

  const Params({required this.id});

  @override
  List<Object?> get props => [id];
}
