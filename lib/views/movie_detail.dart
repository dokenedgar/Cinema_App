import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/models/movie.dart';
import 'package:cinema_app/views/buy_ticket.dart';
import 'package:cinema_app/widgets/shimmer_loading_image.dart';
import 'package:cinema_app/widgets/trailer_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';

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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(bottom: kToolbarHeight + 1.w),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                          Text(
                            'Detail',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12.sp,
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
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: SizedBox(
                        height: 50.h,
                        width: 84.w,
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
                              const ShimmerLoadingImage(
                            duration: Duration(milliseconds: 500),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 2.w, right: 2.w, top: 2.w),
                      child: Text(
                        widget.movie.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
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
                        ),
                      ).toList(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
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
                              initialRating:
                                  num.parse(widget.movie.rating.toString())
                                      .toDouble(),
                              itemSize: 6.w,
                              itemBuilder: (context, _) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                              onRatingUpdate: (value) {},
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
                     Padding(
                      padding: EdgeInsets.only(top: 3.w, left: 6.w),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Synopsis',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13.5.sp,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                           EdgeInsets.only(top: 2.w, left: 6.w, right: 6.w),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(widget.movie.synopsis),
                      ),
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
                      builder: (context) => BuyTicket(
                        movie: widget.movie,
                      ),
                    ),
                  );
                  // await CachedNetworkImage.evictFromCache(
                  //     'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg');
                  //await CachedNetworkImage.evictFromCache('https://m.media-amazon.com/images/M/MV5BMDUzNWJhZWQtYzU3Zi00M2NjLThjZjEtMTRmMjRmNzBmMWI2XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_SX300.jpg');
                },
                child: const Text(
                  'Buy Ticket',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Visibility(
                  visible: widget.movie.trailerCode.trim().isNotEmpty,
                  child: FloatingActionButton(
                    //mini: true,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TrailerPlayer(
                            movie: widget.movie,
                          ),
                        ),
                      );
                    },
                    child: const Icon(Icons.play_arrow),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      // show if there's a trailer
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: Visibility(
      //   visible: widget.movie.trailerCode.trim().isNotEmpty,
      //   child: FloatingActionButton(
      //     //mini: true,
      //     onPressed: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => const TestRenderBox(),
      //         ),
      //       );
      //     },
      //     child: const Icon(Icons.play_arrow),
      //   ),
      // ),
    );
  }
}
