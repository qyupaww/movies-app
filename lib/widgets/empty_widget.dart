import 'package:flutter/material.dart';

import '../constants.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        width: double.infinity,
        child: const Column(
          children: [
            Icon(Icons.hourglass_empty, color: ColorPallete.white),
            SizedBox(height: 20.0),
            Text(
              "No Data",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: ColorPallete.grey,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "Please add if it needed!",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 14.0,
                color: ColorPallete.grey,
              ),
            ),
          ],
        ));
  }
}
