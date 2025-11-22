import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/hero_movie_widget.dart';
import 'package:movies_app/widgets/horizontal_movie_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Movies App",
          style: TextStyle(
            color: ColorPallete.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12.0),
            child: Icon(Icons.cast, color: ColorPallete.white, size: 24),
          ),
        ],
      ),
      body: ListView(
        children: const [
          HeroMovieWidget(),
          SizedBox(height: 12),
          HorizontalMovieListWidget(
            title: "Trending Now",
            listsPath: DummyData.movieListsPath,
          ),
          SizedBox(height: 12),
          HorizontalMovieListWidget(
            title: "Trending of the Week",
            listsPath: DummyData.movieListsPath,
          ),
          SizedBox(height: 12),
          HorizontalMovieListWidget(
            title: "Highest Rating",
            listsPath: DummyData.movieListsPath,
          ),
          SizedBox(height: 12),
          HorizontalMovieListWidget(
            title: "Favorites",
            listsPath: DummyData.movieListsPath,
          ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}
