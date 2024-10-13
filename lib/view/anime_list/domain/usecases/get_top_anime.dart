import 'package:anime_list/core/error/failures.dart';
import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:anime_list/view/anime_list/domain/repositories/anime_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetTopAnime {
  final AnimeRepository repository;

  GetTopAnime(this.repository);

  Future<Either<Failure, List<Anime>>> call(Params params) async {
    return await repository.getTopAnime(params.page);
  }
}

class Params extends Equatable {
  final int page;

  const Params({required this.page});

  @override
  List<Object?> get props => [page];
}