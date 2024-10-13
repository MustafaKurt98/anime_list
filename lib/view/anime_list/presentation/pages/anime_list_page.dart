import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/view/anime_list/presentation/bloc/anime_list_bloc.dart';
import 'package:anime_list/view/anime_list/presentation/widgets/anime_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimeListPage extends StatelessWidget {
  const AnimeListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<AnimeListBloc>()..add(const FetchAnimeList(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Anime'),
        ),
        body: BlocBuilder<AnimeListBloc, AnimeListState>(
          builder: (context, state) {
            if (state is AnimeListLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AnimeListLoaded) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: state.animeList.length,
                itemBuilder: (context, index) {
                  return AnimeListItem(anime: state.animeList[index]);
                },
              );
            } else if (state is AnimeListError) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('No data'));
          },
        ),
      ),
    );
  }
}
