import 'package:flutter/material.dart';
import 'package:fess/services/firestore.dart';

class PostModel extends ChangeNotifier {
  final String title;
  final String content;
  final String timestamp;
  final int votes;
  final int commentNumber;
  final String id;
  final String institution;
  final String feed;
  int voteStatus;
  bool likeStatus;

  PostModel({this.title, this.content, this.timestamp, this.votes, this.commentNumber, this.id, this.institution, this.feed});

  setVote({direction}) async {
    int result;
    if (voteStatus == 0) {
      result = direction;
    } else if (voteStatus == direction) {
      result = 0;
    } else {
      result = voteStatus + (2 * direction);
    }
    bool status = await Firestore().changeVote(institution: institution, feed: feed, id: id, newCount: result, direction: direction);
    if (status) {
      voteStatus = result;
      notifyListeners();
    }
  }

  setLike({direction}) async {
    bool result;
    if (likeStatus == direction) {
      result = !direction;
    } else {
      result = direction;
    }
    bool status = await Firestore().changeLike(direction: direction, id: id);
    if (status) {
      likeStatus = result;
      notifyListeners();
    }
  }
}