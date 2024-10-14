import 'package:anime_list/features/anime_detail/domain/entities/anime_detail.dart';
import 'package:anime_list/features/anime_detail/domain/usecases/get_anime_detail.dart';
import 'package:anime_list/features/anime_detail/presentation/bloc/anime_detail_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'anime_detail_state.dart';

@injectable
class AnimeDetailBloc extends Bloc<AnimeDetailEvent, AnimeDetailState> {
  final GetAnimeDetail getAnimeDetail;

  AnimeDetailBloc({required this.getAnimeDetail})
      : super(AnimeDetailInitial()) {
    on<FetchAnimeDetail>(_onFetchAnimeDetail);
  }

  void _onFetchAnimeDetail(
      FetchAnimeDetail event, Emitter<AnimeDetailState> emit) async {
    emit(AnimeDetailLoading());
    final failureOrAnimeDetail = await getAnimeDetail(Params(id: event.id));
    failureOrAnimeDetail.fold(
      (failure) =>
          emit(const AnimeDetailError(message: 'Failed to fetch anime detail')),
      (animeDetail) => emit(AnimeDetailLoaded(animeDetail: animeDetail)),
    );
  }
}
