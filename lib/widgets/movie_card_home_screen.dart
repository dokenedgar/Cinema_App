import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/views/movie_detail.dart';
import 'package:cinema_app/widgets/shimmer_loading_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieCardHomeScreen extends StatelessWidget {
  const MovieCardHomeScreen({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  String dateToString(int date) {
    if (date == 0) return 'Duration: N/A';
    String result;
    int hour, minute;
    hour = (date / 60).truncate();
    minute = date - (60 * hour);
    if (hour < 10) {
      result = '0${hour}h ';
    } else {
      result = '${hour}h ';
    }

    if (minute < 10) {
      result += '0${minute}m';
    } else {
      result += '${minute}m';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // should be a movie model / object?

      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetail(
            movie: movie,
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              //height: 200,
              //width: 300,
              child: CachedNetworkImage(
                filterQuality: FilterQuality.medium,
                imageUrl: movie.imageMedium,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                placeholder: (context, url) => const ShimmerLoadingImage(
                  duration: Duration(milliseconds: 1000),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              movie.title,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Text(dateToString(movie.duration)),
          RatingBar.builder(
            allowHalfRating: true,
            ignoreGestures: true,
            updateOnDrag: false,
            initialRating: num.parse(movie.rating.toString()).toDouble(),
            itemSize: 24,
            itemBuilder: (context, _) {
              return const Icon(
                Icons.star,
                color: Colors.amber,
              );
            },
            onRatingUpdate: (value) {
              print('update.. $value');
            },
          ),
        ],
      ),
    );
  }
}
