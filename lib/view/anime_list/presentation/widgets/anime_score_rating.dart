import 'package:flutter/material.dart';

class AnimeRating extends StatelessWidget {
  final double score;

  const AnimeRating({Key? key, required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = (score / 2).floor();
    bool hasHalfStar = (score / 2) - fullStars >= 0.5;
    int emptyStars = 5 - fullStars - (hasHalfStar ? 1 : 0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...List.generate(
            fullStars,
            (index) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 16,
                )),
        if (hasHalfStar)
          const Icon(
            Icons.star_half,
            color: Colors.amber,
            size: 16,
          ),
        ...List.generate(
            emptyStars,
            (index) => const Icon(
                  Icons.star_border,
                  color: Colors.amber,
                  size: 16,
                )),
        const SizedBox(width: 8),
        Text(score.toStringAsFixed(1),
            style: const TextStyle(fontSize: 12, color: Colors.amber)),
      ],
    );
  }
}
