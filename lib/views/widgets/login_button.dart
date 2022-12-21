import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatefulWidget {
  final String textContent;
  final Function action;

  LoginButton(this.textContent, this.action);

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> with SingleTickerProviderStateMixin {
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
    child: Text(
      widget.textContent,
      style: TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w700,
        decoration: TextDecoration.underline,
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