import 'package:flutter/material.dart';
import 'package:movies_app/model/movie_general.dart';
import 'package:movies_app/widgets/rounded_image_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

class VerticalMovieGridWidget extends StatelessWidget {
  final String title;
  final List<MovieGeneral> movies;
  final bool isMovieDetail;

  const VerticalMovieGridWidget({
    required this.movies,
    required this.title,
    this.isMovieDetail = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(
          padding: EdgeInsets.only(
            left: isMovieDetail ? 8.0 : 24.0,
          ),
          title: title,
        ),
        const SizedBox(height: 8),
        GridView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 6,
            childAspectRatio: 82 / 96,
            crossAxisSpacing: 6,
          ),
          itemBuilder: (context, index) {
            return RoundedImageWidget(
              path:
                  "https://image.tmdb.org/t/p/w500${movies[index].posterPath}",
            );
          },
          itemCount: _getItemCount(movies.length),
        ),
      ],
    );
  }

  int _getItemCount(int length) {
    if (length > 15) {
      return 15;
    } else {
      return length;
    }
  }
}
