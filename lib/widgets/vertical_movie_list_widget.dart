import 'package:flutter/material.dart';
import 'package:movies_app/widgets/movie_tile_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

import '../constants.dart';

class VerticalMovieListWidget extends StatelessWidget {
  final String title;
  const VerticalMovieListWidget({
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
              title: DummyData.backdropListsTitle[index],
              assetPath:
                  "assets/images/backdrop/${DummyData.backdropListsPath[index]}",
            );
          },
          separatorBuilder: (_, __) {
            return const SizedBox(height: 8);
          },
          itemCount: DummyData.backdropListsPath.length,
        ),
      ],
    );
  }
}
