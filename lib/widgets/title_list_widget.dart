import 'package:flutter/material.dart';

import '../constants.dart';

class TitleListWidget extends StatelessWidget {
  final String title;
  final EdgeInsets? padding;
  const TitleListWidget({
    required this.title,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        title,
        style: const TextStyle(
          color: ColorPallete.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
