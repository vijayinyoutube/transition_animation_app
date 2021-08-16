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
              delay: 900,
              xOffset: 0.0);
        }));

Widget buildContainer(
        {index, horizontalSpacing, verticalSpacing, delay, xOffset = 0.0}) =>
    DelayedDisplay(
      delay: Duration(milliseconds: delay),
      slidingBeginOffset:
          xOffset != 0 ? Offset(xOffset, 0.0) : const Offset(0.0, 0.35),
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: verticalSpacing, horizontal: horizontalSpacing),
        child: Container(
          height: 100,
          width: 100,
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        ),
      ),
    );
