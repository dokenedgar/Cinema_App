import 'package:cinema_app/views/home.dart';
import 'package:cinema_app/views/profile.dart';
import 'package:cinema_app/views/show_time.dart';
import 'package:cinema_app/views/tickets.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  //final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  void _onTapped(int index){
    setState(() {
      _index = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: const [
          Home(),
          ShowTime(),
          Tickets(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 11.sp,
        unselectedFontSize: 9.sp,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,
        //unselectedLabelStyle: const TextStyle(color: Colors.grey),
        //showSelectedLabels: false,
        showUnselectedLabels: true,
        currentIndex: _index,
        onTap: _onTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Show Time',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}