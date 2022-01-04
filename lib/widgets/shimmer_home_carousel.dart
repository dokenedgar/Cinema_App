import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHomeLoading extends StatelessWidget {
  const ShimmerHomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: List.generate(
        3,
        (index) => SingleChildScrollView(
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 300.0,
                  height: 330.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                    width: 180,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4.0),
                  child: Container(
                    width: 100.0,
                    height: 8.0,
                    color: Colors.white,
                  ),
                ),
                RatingBar.builder(
                  allowHalfRating: true,
                  ignoreGestures: true,
                  updateOnDrag: false,
                  initialRating: 5,
                  itemSize: 24,
                  itemBuilder: (context, _) {
                    return const Icon(
                      Icons.star,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
      options: CarouselOptions(
        // height: 300,
        aspectRatio: 0.92,
        viewportFraction: 0.6,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 1,
      ),
    );
  }
}
