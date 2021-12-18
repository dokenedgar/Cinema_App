// ignore: file_names
// ignore: file_names
import 'package:cinema_app/widgets/date_card.dart';
import 'package:flutter/material.dart';

final GlobalKey _widgetKey = GlobalKey();

class TestRenderBox extends StatefulWidget {
  const TestRenderBox({Key? key}) : super(key: key);

  @override
  State<TestRenderBox> createState() => _TestRenderBoxState();
}

class _TestRenderBoxState extends State<TestRenderBox> {
  void _getWidgetInfo(_) {
    final RenderBox renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox;

    final Size size = renderBox.size; // or _widgetKey.currentContext?.size
    print('Size: ${size.width}, ${size.height}');

    final Offset offset = renderBox.localToGlobal(Offset.zero);
    final Offset local = renderBox.size.center(Offset.zero);
    print('Center ${local.dx}, ${local.dy}');
    print('Offset: ${offset.dx}, ${offset.dy}');
    print(
        'Position: ${(offset.dx + size.width) / 2}, ${(offset.dy + size.height) / 2}');
  }

  @override
  void initState() {
    super.initState();
    //  WidgetsBinding.instance?.addPostFrameCallback((_getWidgetInfo));
  }
  List<String> yourArray = ["A", "B", "C", "D"];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Woolha.com Flutter Tutorial'),
        backgroundColor: Colors.teal,
      ),
      // body: Stack(
      //   children: [
      //     Positioned(
      //       left: 50,
      //       top: 50,
      //       child: Container(
      //         key: _widgetKey,
      //         width: 300,
      //         height: 300,
      //         color: Colors.teal,
      //       ),
      //     ),
      //   ],
      // ),
      // body: CustomScrollView(
      //   slivers: [
      //
      //     SliverFillRemaining(
      //       child: Container(),
      //     ),
      //     SliverFixedExtentList(
      //       itemExtent: 100,
      //       delegate: SliverChildListDelegate([
      //         DateCard(backgroundColor: Colors.grey, isSelected: false),
      //         DateCard(backgroundColor: Colors.grey, isSelected: false),
      //         DateCard(backgroundColor: Colors.grey, isSelected: true),
      //         DateCard(backgroundColor: Colors.grey, isSelected: false),
      //       ]),
      //     ),
      //     SliverFillRemaining(
      //       child: Container(),
      //     ),
      //   ],
      // ),
      body: Container(
        height: 100,
        child: ListView.builder(
          physics: PageScrollPhysics(), // this is what you are looking for
          //scrollDirection: Axis.horizontal,
          itemCount: yourArray.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.grey,
              width: 20,
              child: Center(child: Text("Index = ${index}")),
            );
          },
        ),
      ),
    );
  }
}
