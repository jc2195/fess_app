import 'package:fess/views/screens/post_screen.dart';
import 'package:flutter/material.dart';

class PostPreviewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16, left: 16, right: 16),
      padding: EdgeInsets.all(17),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
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
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
              },
              child: Container(
                margin: EdgeInsets.only(top: 11, bottom: 11),
                child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
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