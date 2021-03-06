import 'package:cinema_app/views/root.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            //brightness: Brightness.dark,
            primarySwatch: Colors.deepOrange,
          ),
          home: const MyHomePage(),
        );
      }
    );
  }
}


