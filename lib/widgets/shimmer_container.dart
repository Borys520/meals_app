import 'package:flutter/material.dart';

class ShimmerContainer extends StatelessWidget {
  ShimmerContainer({Key? key, required this.height, required this.width})
      : super(key: key);
  double height;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
