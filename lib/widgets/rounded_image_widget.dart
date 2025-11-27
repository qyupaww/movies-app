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
              return Container(
                color: Colors.grey.shade800,
                alignment: Alignment.center,
                child: const Icon(
                  Icons.broken_image,
                  color: Colors.white54,
                  size: 24,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
