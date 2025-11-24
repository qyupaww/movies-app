import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/movie_image_widget.dart';
import '../widgets/movie_body_widget.dart';

class MoviedetailScreen extends StatelessWidget {
  final Map<String, dynamic> arguments;
  const MoviedetailScreen({required this.arguments, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: ListView(
        children: [
          MovieImageWidget(imagePath: ""),
          MovieBodyWidget(
            movieDetails: movieDetails,
            similarMovies: [],
            isFavorite: true,
          ),
        ],
      ),
    );
  }
}
