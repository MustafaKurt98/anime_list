import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/features/anime_detail/presentation/bloc/anime_detail_event.dart';
import 'package:anime_list/features/anime_detail/presentation/bloc/anime_detail_bloc.dart';
import 'package:anime_list/features/anime_list/domain/entities/anime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../anime_list/presentation/widgets/anime_score_rating.dart';

class AnimeDetailPage extends StatelessWidget {
  final Anime anime;

  const AnimeDetailPage({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AnimeDetailBloc>()..add(FetchAnimeDetail(id: anime.id)),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(anime.title),
        ),
        body: BlocBuilder<AnimeDetailBloc, AnimeDetailState>(
          builder: (context, state) {
            if (state is AnimeDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnimeDetailLoaded) {
              final animeDetail = state.animeDetail;
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          anime.imageUrl,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        anime.type,
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: Text(
                        anime.episodes! > 0 ? ' (${anime.episodes} eps)' : '',
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    AnimeRating(score: anime.score),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: anime.genres
                            .map((genre) => Chip(
                                  label: Text(genre),
                                ))
                            .toList(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        anime.synopsis,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Characters',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                    GridView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.7,
                      ),
                      itemCount: animeDetail.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.network(
                                    animeDetail[index].imageUrl,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                animeDetail[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    )
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
