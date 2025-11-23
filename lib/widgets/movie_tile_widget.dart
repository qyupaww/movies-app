import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class MovieTileWidget extends StatelessWidget {
  final String title;
  final String assetPath;
  const MovieTileWidget({
    required this.title,
    required this.assetPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 140,
              child: Image.network(
                assetPath,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) {
                  return Image.asset(
                    "assets/images/placeholder.jpg",
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                color: ColorPallete.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const Icon(
            Icons.play_arrow,
            color: ColorPallete.white,
            size: 40,
          ),
        ],
      ),
    );
  }
}
