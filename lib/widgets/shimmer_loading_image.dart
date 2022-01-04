import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingImage extends StatelessWidget {
  const ShimmerLoadingImage({Key? key, required this.duration}) : super(key: key);
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: duration,
      child: Container(
        color: Colors.white,
      ),
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
    );
  }
}
