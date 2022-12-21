import 'package:fess/models/global_model.dart';
import 'package:fess/views/widgets/post_preview_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UniversityPostsScreen extends StatelessWidget {

  const UniversityPostsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 21,
        shadowColor: Colors.transparent,
        backgroundColor: const Color(0xff42a4eb),
        centerTitle: false,
        title: Text(
          Provider.of<GlobalModel>(context, listen: false).university,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 17),
            child: Icon(
              Icons.speed,
              color: Colors.white,
              size: 24,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 17),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              onSelected: null,
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'Liked',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.favorite_border,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Liked',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Hot',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.whatshot_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Hot',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Own',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.face_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Own',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              child: Icon(
                Icons.filter_alt_outlined,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 21),
            child: PopupMenuButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
              onSelected: null,
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                PopupMenuItem(
                  value: 'New',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.new_releases_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'New',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Top',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.vertical_align_top,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Top',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 'Bad',
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.thumb_down_alt_outlined,
                          size: 24,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Bad',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
              child: Icon(
                Icons.sort,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: CustomScrollView(
          slivers: [
            CupertinoSliverRefreshControl(

            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  if (true) {
                    return PostPreviewWidget();
                  }
                  return Container(
                    padding: EdgeInsets.only(left: 20, top: 10),
                    width: double.infinity,
                    child: Text(
                      'Nothing here yet...',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                  );
                },
                childCount: 100,
              ),
            ),
          ],
        ),
      ),
    );
  }
}