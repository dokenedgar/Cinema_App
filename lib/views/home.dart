import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_app/models/bottom_nav_bar_enums.dart';
import 'package:cinema_app/view_model/movie_list_home_screen_view_model.dart';
import 'package:cinema_app/widgets/genre.dart';
import 'package:cinema_app/widgets/movie_card_home_screen.dart';
import 'package:cinema_app/widgets/shimmer_home_carousel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late GenresEnum selectedGenre;
  String title = '';
  MoviesList mvList = MoviesList();

  @override
  void initState() {
    mvList.addListener(() {
      setState(() {

      });
      print('val change... ${mvList.movies.length}');
    });
    mvList.getMovies();
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
                child: mvList.movies.isEmpty ? const ShimmerHomeLoading() : CarouselSlider(
                  items: List.generate(
                    mvList.movies.length,
                    (index) => MovieCardHomeScreen(movie: mvList.movies[index]),
                  ),
                  options: CarouselOptions(
                      //height: 300,
                      aspectRatio: 0.92,
                      viewportFraction: 0.6,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
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

            ],
          ),
        ),
      ),
    );
  }
}
