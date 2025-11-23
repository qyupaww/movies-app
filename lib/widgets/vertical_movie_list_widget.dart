import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_general.dart';
import 'package:movies_app/widgets/movie_tile_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

import '../constants.dart';

class VerticalMovieListWidget extends StatelessWidget {
  final String title;
  final List<MovieGeneral> movies;
  const VerticalMovieListWidget({
    required this.movies,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(
          padding: const EdgeInsets.only(left: 24),
          title: title,
        ),
        const SizedBox(height: 8),
        ListView.separated(
          padding: const EdgeInsets.only(bottom: 16),
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return MovieTileWidget(
              title: movies[index].title,
              assetPath:
                  "https://image.tmdb.org/t/p/w500${movies[index].posterPath}",
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(height: 8);
          },
          itemCount: movies.length,
        ),
      ],
    );
  }
}
