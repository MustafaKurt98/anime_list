import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:anime_list/core/injection/injection.dart';
import 'package:anime_list/view/anime_list/presentation/bloc/anime_list_bloc.dart';
import 'package:anime_list/view/anime_list/presentation/widgets/anime_list_item.dart';

class AnimeListPage extends StatefulWidget {
  const AnimeListPage({Key? key}) : super(key: key);

  @override
  _AnimeListPageState createState() => _AnimeListPageState();
}

class _AnimeListPageState extends State<AnimeListPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AnimeListBloc>()..add(const FetchAnimeList(page: 1)),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Top Anime'),
          actions: [
            BlocBuilder<AnimeListBloc, AnimeListState>(
              builder: (context, state) {
                final types = state.animeList
                    .map((anime) => anime.type)
                    .toSet()
                    .toList();
                types.insert(0, 'All Anime');
                return DropdownButton<String>(
                  value: state.selectedType,
                  hint: const Text('All Anime', style: TextStyle(color: Colors.white)),
                  items: types.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value, style: const TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    context
                        .read<AnimeListBloc>()
                        .add(FilterAnimeList(selectedType: newValue ?? ''));
                  },
                );
              },
            ),
          ],
        ),
        body: BlocBuilder<AnimeListBloc, AnimeListState>(
          builder: (context, state) {
            if (state is AnimeListInitial) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.animeList.isNotEmpty) {
              return GridView.builder(
                controller: _scrollController,
                padding: const EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: state.animeList.length + (state.hasReachedMax ? 0 : 1),
                itemBuilder: (context, index) {
                  if (index >= state.animeList.length) {
                    return const Center(child: CircularProgressIndicator());
                  }
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

  void _onScroll() {
    if (_isBottom) {
      context.read<AnimeListBloc>().add( LoadMoreAnime());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}