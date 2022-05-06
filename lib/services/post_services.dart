import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:keyofscience/models/Models.dart';



class postSevices {
  // static final _firestoreInstance =  FirebaseFirestore.instance.collection("comments");
  // a()async{
  //   await _firestoreInstance.doc("post id").collection("comments").snapshots().contains("needle");
  // }

  static final _instance =  FirebaseFirestore.instance;
  static DocumentSnapshot? startAfter;
  static Future<List<Post>> getPosts(int documentLimit,bool setSTARTAFTERtoNull)async{
    try{
      if(setSTARTAFTERtoNull) startAfter=null;
      List<Post> lists= [];
      final res;
      if(startAfter == null){
         res = await _instance.collection("posts").orderBy("date").limit(documentLimit).get();
      }else{
        res = await _instance.collection("posts").limit(documentLimit).orderBy("date").startAfterDocument(startAfter!).get();
      }
      startAfter = res.docs.last;
      print("res.docs.lengthres.docs.length ${res.docs.length}");
      for(int i=0;i<res.docs.length;i++){
        lists.add(
          Post.fromJson(res.docs[i].data())
        );
      }
      return lists;
    }catch (error){
      throw error;
    }
   }
}