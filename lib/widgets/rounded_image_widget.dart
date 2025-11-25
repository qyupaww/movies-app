import 'package:flutter/material.dart';

class RoundedImageWidget extends StatelessWidget {
  final String path;
  final void Function() onTap;
  const RoundedImageWidget(
      {required this.onTap, required this.path, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 120,
          child: Image.network(
            path,
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
    );
  }
}
