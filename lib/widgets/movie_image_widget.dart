import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';

class MovieImageWidget extends StatelessWidget {
  final String imagePath;
  const MovieImageWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 240,
          child: Image.network(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) {
              return Image.asset("assets/images/placeholder.jpg",
                  fit: BoxFit.cover);
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 6.0,
                right: 6.0,
              ),
              alignment: Alignment.center,
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorPallete.darkGrey,
              ),
              child: IconButton(
                padding: const EdgeInsets.all(2.0),
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: ColorPallete.white,
                  size: 16,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
