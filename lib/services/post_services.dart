import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keyofscience/models/Models.dart';



class postSevices {
  // static final _firestoreInstance =  FirebaseFirestore.instance.collection("comments");
  // a()async{
  //   await _firestoreInstance.doc("post id").collection("comments").snapshots().contains("needle");
  // }

  static final _instance =  FirebaseFirestore.instance;

  static Future<List<Post>> getPosts()async{
    return [];
  }
}