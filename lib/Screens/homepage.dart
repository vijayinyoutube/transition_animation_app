import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:transition_animation_app/Widgets/spacer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController = new ScrollController();
  bool shouldAnimate = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50) {
        setState(() {
          shouldAnimate = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animation"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeightSpacer(myHeight: 10.00),
            buildHorizontalListView(context),
            const HeightSpacer(myHeight: 10.00),
            buildVerticalListView(context, _scrollController),
          ],
        ),
      ),
    );
  }

  Widget buildHorizontalListView(BuildContext context) => SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return buildContainer(
              horizontalSpacing: 10.00,
              verticalSpacing: 0.00,
              delay: 0,
              xOffset: 0.35,
              yOffset: 0.0,
            );
          }));

  Widget buildVerticalListView(
          BuildContext context, ScrollController _scrollController) =>
      Expanded(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 50,
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildContainer(
                    horizontalSpacing: 0.00,
                    verticalSpacing: 10.00,
                    delay: 900,
                    xOffset: 0.0,
                    yOffset: 0.35);
              }));

  Widget buildContainer(
          {horizontalSpacing,
          verticalSpacing,
          delay,
          xOffset = 0.0,
          yOffset = 0.0}) =>
      DelayedDisplay(
        delay: shouldAnimate
            ? Duration(milliseconds: delay)
            : const Duration(milliseconds: 0),
        slidingBeginOffset: Offset(xOffset, yOffset),
        fadingDuration: shouldAnimate
            ? const Duration(milliseconds: 800)
            : const Duration(milliseconds: 0),
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
}
