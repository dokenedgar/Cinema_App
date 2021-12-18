import 'package:flutter/material.dart';

class ShowTime extends StatefulWidget {
  const ShowTime({Key? key}) : super(key: key);

  @override
  _ShowTimeState createState() => _ShowTimeState();
}

class _ShowTimeState extends State<ShowTime> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Time'),
      ),
    );
  }
}
