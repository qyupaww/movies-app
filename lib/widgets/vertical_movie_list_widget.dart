import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_general.dart';
import 'package:movies_app/widgets/movie_tile_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../constants.dart';
import '../views/movie_detail_screen.dart';

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
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return BlocProvider.value(
                    value: BlocProvider.of<MovieDetailBloc>(context),
                    child: MovieDetailScreen(
                      arguments: {
                        ArgumentKey.idKey: movies[index].id,
                        ArgumentKey.movieGenerealKey: movies[index],
                      },
                    ),
                  );
                }));
              },
              title: movies[index].title,
              assetPath:
                  "https://image.tmdb.org/t/p/w500/${movies[index].backdropPath}",
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
