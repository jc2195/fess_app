import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeButton extends StatefulWidget {
  final String textContent;
  final Function action;

  WelcomeButton(this.textContent, this.action);

  @override
  _WelcomeButtonState createState() => _WelcomeButtonState();
}

class _WelcomeButtonState extends State<WelcomeButton> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  double _scale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 50,
      ),
      lowerBound: 0.0,
      upperBound: 0.03,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Transform.scale(
        scale: _scale,
        child: _animatedButtonUI,
      ),
    );
  }

  Widget get _animatedButtonUI => Container(
    height: 49,
    width: 192,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.all(Radius.circular(12)),
      boxShadow: [
        BoxShadow(
          offset: Offset(6, 6),
          color: Color(0x29000000),
          blurRadius: 18,
        ),
      ],
    ),
    child: Center(
      child: Text(
        widget.textContent,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.action();
  }
}