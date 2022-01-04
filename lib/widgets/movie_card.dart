import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/views/movie_detail.dart';
import 'package:cinema_app/widgets/shimmer_loading_image.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetail(
                movie: widget.movie,
              ),
            ),
          );
        },
        child: SizedBox(
          //color: Colors.grey,
          height: 250,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: widget.movie.imageMedium,
                filterQuality: FilterQuality.medium,
                height: 220,
                width: 150,
                fit: BoxFit.fill,
                imageBuilder: (context, imageProvider) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.fill,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) => const ShimmerLoadingImage(
                  duration: Duration(milliseconds: 500),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Text(
                  widget.movie.title,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(fontSize: 14),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
