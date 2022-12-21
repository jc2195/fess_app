import 'package:flutter/material.dart';
import 'package:fess/views/screens/post_screen.dart';

class PostWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 33, right: 33, top: 17, bottom: 17),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(-6, 0),
              blurRadius: 16,
            ),
            BoxShadow(
              color: Color(0x1A000000),
              offset: Offset(6, 6),
              blurRadius: 16,
            ),
          ]
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Icon(
                        Icons.hourglass_empty,
                        size: 20,
                      ),
                    ),
                    Text(
                      '16h ago',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.mail_outline,
                size: 20,
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 11, bottom: 12),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 11),
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      size: 24,
                    ),
                    Container(
                      width: 45,
                      child: Text(
                        '632',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    Container(
                      child: Text(
                        '632',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      child: Icon(
                        Icons.chat_bubble_outline,
                        size: 24,
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.favorite_border,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}