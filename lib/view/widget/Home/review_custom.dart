import 'package:flutter/material.dart';

class ReviewCustom extends StatelessWidget {
  const ReviewCustom({super.key, required this.review});
  final double review;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        Text('$review'),
      ],
    );
  }
}
