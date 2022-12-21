import 'package:fess/views/widgets/comment_widget.dart';
import 'package:fess/views/widgets/post_preview_widget.dart';
import 'package:fess/views/widgets/post_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 21,
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xff42a4eb),
        centerTitle: false,
        title: Text(
          'Cambridge',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          CupertinoSliverRefreshControl(

          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PostWidget();
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(top: 14, left: 33),
                  child: Text(
                    'Comments:',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                  return CommentWidget();
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
