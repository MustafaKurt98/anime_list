import 'package:anime_list/view/anime_list/domain/entities/anime.dart';
import 'package:flutter/material.dart';

import 'anime_score_rating.dart';

class AnimeListItem extends StatelessWidget {
  final Anime anime;

  const AnimeListItem({Key? key, required this.anime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: NetworkImage(
                anime.imageUrl,
              ),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) => const Icon(
                Icons.error,
                color: Colors.red,
              ),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 3,
                offset: Offset(0, 4),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  anime.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 5),
                AnimeRating(score: anime.score),
              ],
            ),
          ),
        )
      ],
    );
  }
}
