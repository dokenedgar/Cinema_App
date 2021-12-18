import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_app/views/test_render_box.dart';
import 'package:cinema_app/widgets/date_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieDetail extends StatefulWidget {
  const MovieDetail({Key? key}) : super(key: key);

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  int dayIndex = 1;
  PageController pageController =
      PageController(initialPage: 1, viewportFraction: 0.23);

  List<String> days = ['Wed', 'Thu', 'Fri', 'Sat', 'Sun'];

  List<String> genres = [
    'Action',
    //'Comedy',
    'Drama',
    'History'
    //'Horror',
    //'Sport',
    //'Romance',
    //'Tragedy'
  ];

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
                      padding: const EdgeInsets.all(16.0),
                      child: SizedBox(
                        height: 400,
                        width: 330,
                        child: CachedNetworkImage(
                          filterQuality: FilterQuality.medium,
                          imageUrl:
                              //'https://m.media-amazon.com/images/M/MV5BOTIzYmUyMmEtMWQzNC00YzExLTk3MzYtZTUzYjMyMmRiYzIwXkEyXkFqcGdeQXVyMDM2NDM2MQ@@._V1_SX300.jpg',
                              'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg',
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
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        'The Last Duel',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 4,
                      children: List.generate(
                          genres.length,
                          (index) => Chip(
                                label: Text(genres[index]),
                              )).toList(),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('2021'),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            RatingBar.builder(
                              allowHalfRating: true,
                              ignoreGestures: true,
                              updateOnDrag: false,
                              initialRating: 3.5,
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
                            const Text('02h 18m'),
                            const VerticalDivider(
                              color: Colors.black,
                            ),
                            const Text('PG - 13')
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
                    const Padding(
                      padding: EdgeInsets.only(top: 8.0, left: 24, right: 24),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          //"Twentieth Century Studios and Locksmith Animation’s “Ron’s Gone Wrong” is the story of Barney, a socially awkward middle-schooler and Ron, his new walking, talking, digitally-connected device, which is supposed to be his ‘Best Friend out of the Box.’ Ron’s hilarious malfunctions set against the backdrop of the social media age, launch them into an action-packed journey in which boy and robot come to terms with the wonderful messiness of true friendship."
                          "Told in three viewpoints: husband’s, rapist, wife’s is very informing. Lots of medieval fighting and court machinations. Jodie Comer, Matt Damon, and Adam Driver are well-cast as three leads. Over two hours long but won’t feel it. Stay for update at end.",
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 150,
                      child: PageView.builder(
                        physics: const CustomPageViewScrollPhysics(),
                        itemCount: 5,
                        pageSnapping: true,
                        controller: pageController,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              if (dayIndex == index)
                                DateCard(
                                  day: days[index],
                                  date: (index + 10).toString(),
                                  isSelected: true,
                                ),
                              if (dayIndex != index)
                                Positioned(
                                  bottom: 20,
                                  child: InkWell(
                                    onTap: () => pageController.animateToPage(
                                      index,
                                      duration:
                                          const Duration(milliseconds: 500),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                    ),
                                    child: DateCard(
                                      date: (index + 10).toString(),
                                      day: days[index],
                                      isSelected: false,
                                    ),
                                  ),
                                ),
                            ],
                          );
                        },
                        onPageChanged: (index) {
                          setState(() {
                            dayIndex = index;
                          });
                        },
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
              child: SizedBox(
                height: kToolbarHeight,
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: () async {
                    await CachedNetworkImage.evictFromCache(
                        'https://m.media-amazon.com/images/M/MV5BZGExZTUzYWQtYWJjZi00OTI4LTk4OGYtNTA2YzcwMmNiZTMxXkEyXkFqcGdeQXVyMTEyMjM2NDc2._V1_FMjpg_UX1000_.jpg');
                    //await CachedNetworkImage.evictFromCache('https://m.media-amazon.com/images/M/MV5BMDUzNWJhZWQtYzU3Zi00M2NjLThjZjEtMTRmMjRmNzBmMWI2XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_SX300.jpg');
                  },
                  child: const Text(
                    'Buy Ticket',
                    style: TextStyle(fontSize: 16),
                  ),
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
