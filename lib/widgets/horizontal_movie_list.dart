import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movie_detail_bloc/movie_detail_bloc.dart';
import '../constants.dart';
import '../views/movie_detail_screen.dart';
import 'rounded_image_widget.dart';
import 'title_list_widget.dart';
import '../model/movie_section.dart';

class HorizontalMovieListWidget extends StatelessWidget {
  final MovieSection movieSection;
  const HorizontalMovieListWidget({
    required this.movieSection,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleListWidget(title: movieSection.title),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RoundedImageWidget(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return BlocProvider.value(
                        value: BlocProvider.of<MovieDetailBloc>(context),
                        child: MovieDetailScreen(
                          arguments: {
                            ArgumentKey.idKey: movieSection.movies[index].id,
                            ArgumentKey.movieGenerealKey:
                                movieSection.movies[index],
                          },
                        ),
                      );
                    }));
                  },
                  path:
                      "https://image.tmdb.org/t/p/w500/${movieSection.movies[index].posterPath}",
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 8);
              },
              itemCount: movieSection.movies.length,
            ),
          ),
        ],
      ),
    );
  }
}
