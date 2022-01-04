import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerGenresLoading extends StatelessWidget {
  const ShimmerGenresLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          5,
          (index) => Padding(
            padding: const EdgeInsets.only(right: 6.0),
            child: Container(
              width: 90,
              height: 36.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8)
              ),

            ),
          ),
        ),
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
