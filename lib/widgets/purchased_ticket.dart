import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/views/movie_detail.dart';
import 'package:cinema_app/widgets/shimmer_loading_image.dart';
import 'package:cinema_app/widgets/ticket_clip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PurchasedTicket extends StatefulWidget {
  const PurchasedTicket({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  _PurchasedTicketState createState() => _PurchasedTicketState();
}

class _PurchasedTicketState extends State<PurchasedTicket> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MovieDetail(
              movie: widget.movie,
            ),
          ),
        ),
        child: ClipPath(
          clipper: TicketClip(),
          child: Container(
            height: 150,
            decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl: widget.movie.imageMedium,
                  filterQuality: FilterQuality.medium,
                  height: 150,
                  width: 100,
                  fit: BoxFit.cover,
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                  placeholder: (context, url) => const ShimmerLoadingImage(
                    duration: Duration(milliseconds: 500),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 34.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(
                            widget.movie.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        const Text('21 December \'21'),
                        const Text('04:00 pm'),
                        RatingBar.builder(
                          allowHalfRating: true,
                          ignoreGestures: true,
                          updateOnDrag: false,
                          initialRating: num.parse(widget.movie.rating.toString()).toDouble(),
                          itemSize: 20,
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
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
