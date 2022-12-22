import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'shimmer_container.dart';

class DishesShimmer extends StatelessWidget {
  const DishesShimmer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      period: const Duration(seconds: 5),
      direction: ShimmerDirection.ltr,
      gradient: const LinearGradient(
        colors: [
          Colors.black12,
          Colors.white,
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerContainer(height: 40, width: 200),
          SizedBox(
            height: 200,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ShimmerContainer(height: 200, width: 200),
                ShimmerContainer(height: 200, width: 200),
                ShimmerContainer(height: 200, width: 200),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
