import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/cta_button_widget.dart';
import 'package:movies_app/widgets/icon_label_widget.dart';
import 'package:movies_app/widgets/vertical_movie_grid_widget.dart';

import '../model/genre.dart';
import '../model/movie_details.dart';
import '../model/movie_general.dart';

class MovieBodyWidget extends StatelessWidget {
  final MovieDetails movieDetails;
  final List<MovieGeneral> similarMovies;
  final bool isFavorite;
  const MovieBodyWidget(
      {required this.movieDetails,
      required this.similarMovies,
      required this.isFavorite,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8.0),
          Text(
            movieDetails.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              color: ColorPallete.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8.0),
          Row(
            children: [
              Text(
                "${_getYear(movieDetails.releaseDate)}",
                style: const TextStyle(
                  color: ColorPallete.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4.0),
              const Text(
                "-",
                style: TextStyle(
                  color: ColorPallete.white,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ),
              ),
              const SizedBox(width: 4.0),
              Text(
                "${movieDetails.runtime} Minutes",
                style: const TextStyle(
                  color: ColorPallete.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
              )
            ],
          ),
          const SizedBox(height: 12.0),
          CtaButtonWidget(
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
              size: 36,
            ),
          ),
          const SizedBox(height: 12.0),
          CtaButtonWidget(
            backgroundColor: ColorPallete.mineShaft,
            onPressed: () {},
            text: const Text(
              "Download",
              style: TextStyle(
                color: ColorPallete.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(
              Icons.download,
              color: ColorPallete.white,
              size: 36,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            movieDetails.overview,
            style: const TextStyle(
                color: ColorPallete.white,
                fontSize: 13,
                fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 14.0),
          Text(
            "Genres: ${_getGenreLists(movieDetails.genres)}",
            style: const TextStyle(
              color: ColorPallete.white,
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            children: [
              IconLabelWidget(
                icon: isFavorite ? Icons.check : Icons.add,
                label: "My List",
                onTap: () {},
              ),
              IconLabelWidget(
                icon: Icons.thumb_up,
                label: "Rate",
                onTap: () {},
              ),
              IconLabelWidget(
                icon: Icons.send,
                label: "Share",
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          VerticalMovieGridWidget(
            movies: similarMovies,
            title: "More Like This",
            isMovieDetail: true,
          ),
        ],
      ),
    );
  }

  int _getYear(String? dateString) {
    if (dateString != null) {
      DateTime dateTime = DateTime.parse(dateString);
      int year = dateTime.year;
      return year;
    }
    return 1970;
  }

  String _getGenreLists(List<Genre>? genres) {
    if (genres != null && genres.isNotEmpty) {
      List<String> genreNames = genres.map((e) => e.name).toList();
      return genreNames.join(", ");
    }
    return "No Information";
  }
}
