import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:delayed_display/delayed_display.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildHorizontalListView(context),
          buildVerticalListView(context),
        ],
      )),
    );
  }
}

Widget buildHorizontalListView(BuildContext context) => SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 150,
    child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return buildContainer(
              index: context,
              horizontalSpacing: 10.00,
              verticalSpacing: 0.00,
              delay: 0,
              xOffset: 0.35);
          // buildHorizontalContainer(index);
        }));

Widget buildVerticalListView(BuildContext context) => Expanded(
    child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 50,
        itemBuilder: (context, index) {
          return buildContainer(
              index: context,
              horizontalSpacing: 0.00,
              verticalSpacing: 10.00,
              delay: 0,
              xOffset: 0.0);
          // buildVerticalContainer(index);
        }));

Widget buildContainer(
        {index, horizontalSpacing, verticalSpacing, delay, xOffset=0.0}) =>
    DelayedDisplay(
      delay: Duration(milliseconds: delay),
      slidingBeginOffset: Offset(xOffset, 0.0),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: horizontalSpacing, horizontal: horizontalSpacing),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
      ),
    );

// Widget buildHorizontalContainer(int index) => DelayedDisplay(
//       delay: const Duration(milliseconds: 0),
//       slidingBeginOffset: const Offset(0.35, 0.0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10.00),
//         child: Container(
//           height: 100,
//           width: 100,
//           color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//         ),
//       ),
//     );

// Widget buildVerticalContainer(int index) => DelayedDisplay(
//       delay: const Duration(milliseconds: 0),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10.00),
//         child: Container(
//           height: 100,
//           width: 100,
//           color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
//         ),
//       ),
//     );