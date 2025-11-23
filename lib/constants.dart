import 'package:flutter/material.dart';

class ColorPallete {
  static const primaryColor = Color(0xFFE50914);
  static const secondaryColor = Color(0xFFB20710);
  static const mineShaft = Color(0xFF221F1F);
  static const black = Color(0xFF000000);
  static const white = Color(0xFFF5F5F1);
  static const grey = Color(0xFF564D4D);
  static const darkGrey = Color(0xFF393434);
}

enum HomeSectionType {
  trendingDay,
  trendingWeek,
  comedy,
  drama,
  history,
  horror,
}

class DummyData {
  static const movieListsPath = [
    "500dos.jpg",
    "alice.jpg",
    "architecture_101.jpg",
    "beautiful_bouqet.jpg",
    "frieren.jpg",
    "onepiece.jpg",
    "yataome.jpg",
  ];

  static const backdropListsPath = [
    "3a.jpg",
    "onepiece.jpg",
    "conan.jpg",
    "conan2.png",
  ];

  static const backdropListsTitle = [
    "San nen A gumi",
    "One Piece Film RED",
    "Detective Conan Movie",
    "Detective Conan Movie",
  ];
}
