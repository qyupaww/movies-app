import 'package:flutter/material.dart';
import 'package:movies_app/widgets/rounded_image_widget.dart';
import 'package:movies_app/widgets/title_list_widget.dart';

class HorizontalMovieListWidget extends StatelessWidget {
  final String title;
  final List<String> listsPath;
  const HorizontalMovieListWidget({
    required this.title,
    required this.listsPath,
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
          TitleListWidget(title: title),
          const SizedBox(height: 8),
          SizedBox(
            height: 180,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return RoundedImageWidget(
                  path: "assets/images/${listsPath[index]}",
                );
              },
              separatorBuilder: (_, __) {
                return const SizedBox(width: 8);
              },
              itemCount: listsPath.length,
            ),
          ),
        ],
      ),
    );
  }
}
