import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/search_bar_widget.dart';
import 'package:movies_app/widgets/vertical_movie_list_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorPallete.black,
        body: ListView(
          children: [
            SearchBarWidget(),
            SizedBox(height: 12),
            VerticalMovieListWidget(title: "Now Playing"),
          ],
        ),
      ),
    );
  }
}
