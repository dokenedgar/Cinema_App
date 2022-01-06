import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sizer/sizer.dart';

class DateCard extends StatefulWidget {
  const DateCard(
      {required this.date,
      required this.day,
      required this.isSelected,
      Key? key})
      : super(key: key);
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
          colors: [
            Colors.black.withOpacity(0.7),
            widget.isSelected ? Colors.deepOrange : Colors.grey.withOpacity(0.4)
          ],
          begin: FractionalOffset.bottomLeft,
          end: FractionalOffset.topRight,
        ),
        //color: widget.isSelected ? Colors.orangeAccent: Colors.grey.shade400,
        borderRadius: BorderRadius.circular(12),
      ),
      height: widget.isSelected ? 25.w : 23.w,
      width: widget.isSelected ? 19.w : 17.w,
      child: Stack(
        children: [
          Positioned(
            bottom: 4.5.w,
            left: -2.w,
            child: Icon(
              Icons.circle,
              size: 3.5.w,
            ),
          ),
          Positioned(
            bottom: 4.5.w,
            right: -2.w,
            child: Icon(
              Icons.circle,
              size: 3.5.w,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 3.w),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.circle,
                size: 2.5.w,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 3.5.w, bottom: 1.w),
                  child: Text(
                    widget.day,
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.white,
                    ),
                  ),
                ),
                Text(
                  widget.date,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.sp,
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
