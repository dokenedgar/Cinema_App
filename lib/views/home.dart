import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/models/bottom_nav_bar_enums.dart';
import 'package:cinema_app/service/web_service.dart';
import 'package:cinema_app/views/movie_detail.dart';
import 'package:cinema_app/widgets/genre.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GenresEnum selectedGenre;
  String title = '';
  WebService webService = WebService();

  @override
  void initState() {
    webService.getMovies();
    selectedGenre = GenresEnum.none;
    super.initState();
  }

  void setGenre(GenresEnum clickedGenre) {
    if (selectedGenre == clickedGenre) {
      setState(() {
        selectedGenre = GenresEnum.none;
      });
    } else {
      setState(() {
        selectedGenre = clickedGenre;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //appBar: AppBar(
         //systemOverlayStyle: SystemUiOverlayStyle.dark,
      //   title: const Text('Home'),
       //),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 2.0, left: 16, right: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  title: Text(
                    'Hey, Kim Jong Un',
                  ),
                  subtitle: Text('Today, 13 December'),
                  trailing: Icon(
                    Icons.notifications,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 32.0, right: 32.0, top: 16),
                child: TextFormField(
                  decoration: InputDecoration(
                    label: const Text('Movie search'),
                    labelStyle: const TextStyle(color: Colors.grey),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(width: 0.5, color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 32.0, top: 24, bottom: 8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Categories',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  top: 8,
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: Genre(
                          title: GenresEnum.action,
                          selectedGenre: selectedGenre,
                        ),
                        onTap: () {
                          setGenre(GenresEnum.action);
                        },
                      ),
                      InkWell(
                        child: Genre(
                          title: GenresEnum.comedy,
                          selectedGenre: selectedGenre,
                        ),
                        onTap: () {
                          setGenre(GenresEnum.comedy);
                        },
                      ),
                      InkWell(
                        child: Genre(
                          title: GenresEnum.romance,
                          selectedGenre: selectedGenre,
                        ),
                        onTap: () {
                          setGenre(GenresEnum.romance);
                        },
                      ),
                      InkWell(
                        child: Genre(
                          title: GenresEnum.thriller,
                          selectedGenre: selectedGenre,
                        ),
                        onTap: () {
                          setGenre(GenresEnum.thriller);
                        },
                      ),
                      InkWell(
                        child: Genre(
                          title: GenresEnum.horror,
                          selectedGenre: selectedGenre,
                        ),
                        onTap: () {
                          setGenre(GenresEnum.horror);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(
                  left: 32.0,
                  top: 24,
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Popular',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0),
                child: CarouselSlider(
                  items: List.generate(
                    5,
                    (index) => InkWell(
                      // should be a movie model / object?

                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MovieDetail(),
                        ),
                      ),
                      child: SizedBox(
                        height: 300,
                        width: 300,
                        child: CachedNetworkImage(
                          filterQuality: FilterQuality.medium,
                          imageUrl:
                              'https://m.media-amazon.com/images/M/MV5BMDUzNWJhZWQtYzU3Zi00M2NjLThjZjEtMTRmMjRmNzBmMWI2XkEyXkFqcGdeQXVyODIyOTEyMzY@._V1_SX300.jpg',
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
                  ),
                  options: CarouselOptions(
                      //height: 300,
                      aspectRatio: 1.1,
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      initialPage: 1,
                      onPageChanged: (index, reason) {
                        print('index $index');
                        print('reason $reason');
                        setState(() {
                          title = index.toString();
                        });
                      }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
                child: Text(
                  'Spider Man: No Way Home $title',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const Text('02 Hours, 18 Minutes'),
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
            ],
          ),
        ),
      ),
    );
  }
}
