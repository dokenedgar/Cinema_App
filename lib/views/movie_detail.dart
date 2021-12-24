import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/views/buy_ticket.dart';
import 'package:cinema_app/views/test_render_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

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

class _MovieDetailState extends State<MovieDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(bottom: kToolbarHeight),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          const Text(
                            'Detail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.share_outlined),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SizedBox(
                        height: 450,
                        width: 350,
                        child: CachedNetworkImage(
                          filterQuality: FilterQuality.medium,
                          imageUrl: widget.movie.imageLarge,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                      child: Text(
                        widget.movie.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4,
                      children: List.generate(
                          widget.movie.genre.length,
                          (index) => Chip(
                                label: Text(widget.movie.genre[index]),
                              )).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(widget.movie.year.toString()),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            RatingBar.builder(
                              allowHalfRating: true,
                              ignoreGestures: true,
                              updateOnDrag: false,
                              initialRating: num.parse(widget.movie.rating.toString()).toDouble(),
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
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            Text(
                              dateToString(widget.movie.duration),
                            ),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            Text(widget.movie.mpaRating)
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 16.0, left: 24),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Synopsis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0, left: 24, right: 24),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          widget.movie.synopsis
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CupertinoButton.filled(
                onPressed: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BuyTicket()));
                  // await CachedNetworkImage.evictFromCache(
                  //     'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg');
                  //await CachedNetworkImage.evictFromCache('https://m.media-amazon.com/images/M/MV5BMDUzNWJhZWQtYzU3Zi00M2NjLThjZjEtMTRmMjRmNzBmMWI2XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_SX300.jpg');
                },
                child: const Text(
                  'Buy Ticket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
      // show if there's a trailer
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Visibility(
        visible: false,
        child: FloatingActionButton(
          mini: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TestRenderBox(),
              ),
            );
          },
          child: const Icon(Icons.play_arrow),
        ),
      ),
    );
  }
}
