import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/view/anime_detail/presentation/bloc/anime_detail.event.dart';
import 'package:anime_list/view/anime_detail/presentation/bloc/anime_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeDetailPage extends StatelessWidget {
  final int animeId;

  const AnimeDetailPage({Key? key, required this.animeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnimeDetailBloc>()..add(FetchAnimeDetail(id: animeId)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Anime Detail'),
        ),
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            if (state is AnimeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnimeDetailLoaded) {
              final anime = state.animeDetail;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(anime.imageUrl),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        anime.title,
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        anime.synopsis,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              );
            } else if (state is AnimeDetailError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: Text('Unknown state'),
              );
            }
          },
        ),
      ),
    );
  }
}