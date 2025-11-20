import 'package:flutter/material.dart';
import 'package:movies_app/widgets/cta_button_widget.dart';

import '../constants.dart';

class HeroMovieWidget extends StatelessWidget {
  const HeroMovieWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      height: 400,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/images/onepiece.jpg"),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          width: 0.1,
          color: ColorPallete.white,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "One Piece",
            style: TextStyle(
              color: ColorPallete.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: CtaButtonWidget(
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
              ),
              const SizedBox(height: 8),
              Expanded(
                child: CtaButtonWidget(
                  backgroundColor: ColorPallete.mineShaft,
                  onPressed: () {},
                  text: const Text(
                    "My List",
                    style: TextStyle(
                      color: ColorPallete.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  icon: const Icon(
                    Icons.play_arrow,
                    color: ColorPallete.white,
                    size: 36,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
