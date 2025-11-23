import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_general.dart';
import 'cta_button_widget.dart';
import '../constants.dart';

class HeroMovieWidget extends StatelessWidget {
  final MovieGeneral movie;
  const HeroMovieWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),
        height: 550,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            width: 0.1,
            color: ColorPallete.white,
          ),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 16,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(
                        color: ColorPallete.white,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CtaButtonWidget(
                          backgroundColor: ColorPallete.white,
                          onPressed: () {},
                          text: const Text(
                            "Play",
                            style: TextStyle(
                              color: ColorPallete.mineShaft,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(
                            Icons.play_arrow,
                            color: ColorPallete.mineShaft,
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CtaButtonWidget(
                          backgroundColor: ColorPallete.mineShaft,
                          onPressed: () {},
                          text: const Text(
                            "My List",
                            style: TextStyle(
                              color: ColorPallete.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          icon: const Icon(
                            Icons.list,
                            color: ColorPallete.white,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
