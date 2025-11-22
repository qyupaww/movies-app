import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/widgets/rounded_image_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

class VerticalMovieGridWidget extends StatelessWidget {
  final String title;
  const VerticalMovieGridWidget({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleListWidget(padding: const EdgeInsets.only(left: 24), title: title),
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
              path: "assets/images/${DummyData.movieListsPath[index]}",
            );
          },
          itemCount: DummyData.movieListsPath.length,
        ),
      ],
    );
  }
}
