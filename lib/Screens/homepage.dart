import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:transition_animation_app/Widgets/spacer.dart';
import 'package:visibility_detector/visibility_detector.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double visiblePercentage = 0.0;
  var key;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            const HeightSpacer(myHeight: 10.00),

            // buildVerticalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            buildHorizontalListView(context),
            const HeightSpacer(myHeight: 10.00),
          ],
        )),
      ),
    );
  }

  Widget buildHorizontalListView(BuildContext context) => VisibilityDetector(
        key: UniqueKey(),
        onVisibilityChanged: (visibilityInfo) {
          visiblePercentage = visibilityInfo.visibleFraction * 100;
          key = visibilityInfo.key;
          debugPrint(
              'Widget ${visibilityInfo.key} is ${visiblePercentage}% visible');
        },
        child: SizedBox(
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
                      delay: 800,
                      xOffset: 0.35,
                      yOffset: 0.0,
                      myKey: key);
                })),
      );

  Widget buildVerticalListView(BuildContext context) => Expanded(
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 50,
          itemBuilder: (context, index) {
            return buildContainer(
                index: context,
                horizontalSpacing: 0.00,
                verticalSpacing: 10.00,
                delay: 800,
                xOffset: 0.0,
                yOffset: 0.35);
          }));

  Widget buildContainer(
          {index,
          horizontalSpacing,
          verticalSpacing,
          delay,
          xOffset = 0.0,
          yOffset = 0.0,
          myKey}) =>
      Container(
        key: myKey,
        child: DelayedDisplay(
          delay: Duration(milliseconds: delay),
          slidingBeginOffset: Offset(xOffset, yOffset),
          fadingDuration: Duration(milliseconds: delay),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: verticalSpacing, horizontal: horizontalSpacing),
            child: Container(
              height: 100,
              width: 100,
              color:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
            ),
          ),
        ),
      );
}
