import 'package:cinema_app/models/bottom_nav_bar_enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Genre extends StatefulWidget {
   const Genre({
    Key? key,
    required this.title, required this.selectedGenre
  }) : super(key: key);
    final GenresEnum title;

    final GenresEnum selectedGenre;
  //final VoidCallback onClick;

  @override
  _GenreState createState() => _GenreState();
}

class _GenreState extends State<Genre> {
  late String titleString;
  late bool isSelected;

  @override
  void initState() {
    super.initState();
    titleString = describeEnum(widget.title);


  }

  @override
  Widget build(BuildContext context) {
    isSelected = widget.title == widget.selectedGenre;
    return Padding(
      padding: const EdgeInsets.only(right: 6.0),
      child: Container(
        height: 36,
        width: 90,
        child: Center(
          child: Text(
            titleString.replaceFirst(
                titleString[0], titleString[0].toUpperCase()),
            style: const TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
        decoration: BoxDecoration(
          color: isSelected ? Colors.red : Colors.grey,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
