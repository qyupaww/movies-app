import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String path;
  const RoundedImageWidget({
    required this.path,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: 120,
        child: Image.asset(
          path,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
