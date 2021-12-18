import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class DateCard extends StatefulWidget {
  const DateCard({required this.date, required this.day, required this.isSelected, Key? key}) : super(key: key);
  final bool isSelected;
  final String date;
  final String day;
  @override
  _DateCardState createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.black87, widget.isSelected ? Colors.deepOrange: Colors.grey],
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.topRight,

        ),
           borderRadius: BorderRadius.circular(12)),
      height: 100,
      width: 80,
      child: Stack(
        children: [
          Positioned(
            bottom: 18,
            left: -8,
            child: Icon(
              Icons.circle,
              size: 14,
            ),
          ),
          Positioned(
            bottom: 18,
            right: -8,
            child: Icon(
              Icons.circle,
              size: 14,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.circle,
                size: 10,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 14.0, bottom: 4),
                  child: Text(
                    widget.day,
                    style: TextStyle(color: Colors.white60, fontSize: 16),
                  ),
                ),
                Text(
                  widget.date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}



class CustomPageViewScrollPhysics extends ScrollPhysics {
  const CustomPageViewScrollPhysics({ScrollPhysics? parent})
      : super(parent: parent);

  @override
  CustomPageViewScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return CustomPageViewScrollPhysics(parent: buildParent(ancestor));
  }

  @override
  SpringDescription get spring => const SpringDescription(
    mass: 50,
    stiffness: 10,
    damping: 1,
  );
}

