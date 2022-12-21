import 'package:flutter/material.dart';

class MoodScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff42a4eb),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 30),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'The Mood Meter',
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text(
                  'Over the past day…',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 24),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 23,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(
                        text: 'Cambridge',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' has been feeling angry 😡',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
