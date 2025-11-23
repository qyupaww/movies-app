import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/vertical_movie_list_widget.dart';

class MyListScreen extends StatelessWidget {
  const MyListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          "My List",
          style: TextStyle(
            color: ColorPallete.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit,
              color: ColorPallete.white,
              size: 24,
            ),
          ),
        ],
      ),
      body: const SingleChildScrollView(
        child: VerticalMovieListWidget(
          title: "Favorites",
          movies: [],
        ),
      ),
    );
  }
}
