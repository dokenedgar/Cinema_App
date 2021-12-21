import 'package:flutter/material.dart';
import 'dart:math' as math;
class TicketClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();



    //path.addArc(Rect.fromLTWH(0, 0, size.width, size.height), degToRad(180).toDouble(), degToRad(90).toDouble());
    //path.addArc(Rect.fromLTWH(size.height, 0, 12, 12), degToRad(180).toDouble(), degToRad(90).toDouble());

    path.lineTo(size.width * 0.30, 0);
    path.quadraticBezierTo(size.width * 0.37, size.height - 125, size.width * 0.45, 0);
    path.lineTo(size.width, 0);
   //path.lineTo(size.width, 0);
   path.lineTo(size.width, size.height);
   path.lineTo(0, size.height);
    print(path.computeMetrics());
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return false;
  }
  
}