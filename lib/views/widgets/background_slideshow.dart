import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'dart:core';

// This widget creates an auto-playing slideshow from an array of image assets
// Intended for use as background for welcome screens
class BackgroundSlideshow extends StatefulWidget{
  final List resourceList;

  BackgroundSlideshow(this.resourceList);

  @override
  _BackgroundSlideshowState createState() => _BackgroundSlideshowState();
}

class _BackgroundSlideshowState extends State<BackgroundSlideshow>{
  Timer transitionTimer;
  Random random = Random();
  int picNum;
  int resourceLength;
  String _image;
  List picOrder;

  @override
  void initState() {
    super.initState();
    resourceLength = widget.resourceList.length;

    // Creates a random order list of the images and picks a random starting point from this list
    // This was done so that the user does not view the same images in the same order each time
    picOrder = widget.resourceList;
    picOrder.shuffle();
    picNum = random.nextInt(resourceLength);
    _image = picOrder[picNum];

    // Creates a timer which changes _image every 5 seconds in the order of the randomised array
    transitionTimer = Timer.periodic(Duration(seconds: 5), (Timer t) => setState(() {
      picNum == resourceLength - 1 ? picNum = 0 : picNum += 1;
      _image = picOrder[picNum];
    }));
  }

  @override
  void dispose() {
    transitionTimer.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(seconds: 1),
      child: Stack(
        key: UniqueKey(),
        children: [
          SlidingImage(_image),
        ],
      ),
    );
  }
}

class SlidingImage extends StatefulWidget{
  final String image;

  SlidingImage(this.image);

  @override
  _SlidingImageState createState() => _SlidingImageState();
}

class _SlidingImageState extends State<SlidingImage> with TickerProviderStateMixin{
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
    animation = Tween<double>(begin: -65, end: -105).animate(_controller)
      ..addListener(() {
        setState(() {
        });
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: UniqueKey(),
      left: animation.value,
      height: MediaQuery.of(context).size.height,
      child: Image(
        image: AssetImage(widget.image),
        fit: BoxFit.fitHeight,
      ),
    );
  }
}