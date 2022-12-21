import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fess/views/widgets/notifier_widget.dart';

class Firestore {

  Future<void> firebaseInit() async {
    await Firebase.initializeApp();
  }

  Future<List> getInstitutions() async {
    CollectionReference ref = FirebaseFirestore.instance.collection(FirestorePath.institutions());
    QuerySnapshot snapshot = await ref.get();
    return snapshot.docs;
  }

  Future<Map> getColleges(institutionId) async {
    DocumentReference ref = FirebaseFirestore.instance.doc(FirestorePath.colleges(institutionId));
    DocumentSnapshot snapshot = await ref.get();
    return snapshot.data()['colleges'];
  }

  Future addNewUser({id, college, university}) async {
    await FirebaseFirestore.instance.doc(FirestorePath.users(id)).set({'university': university, 'college': college});
  }

  Future getUserUniversityAndCollege() async {
    User user = FirebaseAuth.instance.currentUser;
    DocumentReference ref = FirebaseFirestore.instance.doc(FirestorePath.users(user.uid));
    DocumentSnapshot snapshot = await ref.get();
    return snapshot.data();
  }

  Future makePost({institution, feed, postContent, postTitle}) async {
    String userId = FirebaseAuth.instance.currentUser.uid;
    await FirebaseFirestore.instance.collection(FirestorePath.postLocation(institution, feed)).add({
      'content': postContent,
      'title': postTitle,
      'user_id': userId,
      'votes': 0,
      'comment_count': 0,
      'created': FieldValue.serverTimestamp()
    });
  }

  Future changeVote({institution, feed, id, newCount, direction}) async {
    try {
      String userId = FirebaseAuth.instance.currentUser.uid;
      DocumentReference userRef = FirebaseFirestore.instance.doc(FirestorePath.postInteractions(userId, id));
      DocumentReference postRef = FirebaseFirestore.instance.doc(FirestorePath.post(institution, feed, id));
      await userRef.update({'vote_status': direction});
      await postRef.update({'votes': newCount});
      return true;
    } catch (e) {
      if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
      return false;
    }
  }

  Future changeLike({direction, id}) async {
    try {
      String userId = FirebaseAuth.instance.currentUser.uid;
      DocumentReference userRef = FirebaseFirestore.instance.doc(FirestorePath.postInteractions(userId, id));
      await userRef.update({'like_status': direction});
      return true;
    } catch (e) {
      if (e.code == 'network-request-failed') {
        NotifierWidget(message: "Can't connect to the internet!");
      }
      return false;
    }
  }
}

class FirestorePath {

  static String institutions() => 'institutions/';
  static String colleges(institutionId) => 'institutions/$institutionId';
  static String users(id) => 'users/$id';
  static String postLocation(institution, feed) => 'posts/$institution/$feed';
  static String post(institution, feed, id) => 'posts/$institution/$feed/$id';
  static String postInteractions(userId, postId) => 'users/$userId/postInteractions/$postId';

}

