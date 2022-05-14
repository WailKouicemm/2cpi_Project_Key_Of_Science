import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/services/Authenctication.dart';



class postSevices {
  // static final _firestoreInstance =  FirebaseFirestore.instance.collection("comments");
  // a()async{
  //   await _firestoreInstance.doc("post id").collection("comments").snapshots().contains("needle");
  // }

  static final _firestoreInstance =  FirebaseFirestore.instance;
  static DocumentSnapshot? startAfter;
  static Future<List<Post>> getPosts(int documentLimit,bool setSTARTAFTERtoNull)async{
    try{
      if(setSTARTAFTERtoNull) startAfter=null;
      List<Post> lists= [];
      final res;
      if(startAfter == null){
         res = await _firestoreInstance.collection("posts").orderBy("date",descending: true).limit(documentLimit).get();
      }else{
        res = await _firestoreInstance.collection("posts").limit(documentLimit).orderBy("date",descending: true).startAfterDocument(startAfter!).get();
      }
      startAfter = res.docs.last;
      print("res.docs.lengthres.docs.length ${res.docs.length}");
      for(int i=0;i<res.docs.length;i++){
        print("res.docs[i].data()['email'] ${res.docs[i].data()['email']}");
        final user userr = await AuthService.getUser(res.docs[i].data()['email'] ?? '');
        final bool isLiked = await isLike(
          postId: res.docs[i].data()['id']);
        lists.add(
          Post.fromJson(res.docs[i].data(),userr,isLiked)
        );
      }
      return lists;
    }catch (error){
      throw error;
    }
   }


  static Future<bool> isLike({required String  postId})async{
    final String email = await FirebaseAuth.instance.currentUser!.email ?? '';
    final DocumentSnapshot  res;
      res = await _firestoreInstance.collection('comments').doc(postId).collection('likes').doc(email).get();
    return res.exists;
   }

  static Future<void> like({required String  postId})async{
    final String email = await FirebaseAuth.instance.currentUser!.email ?? '';
    bool islike = await  isLike(postId: postId);
    final likesCollection = _firestoreInstance.collection('comments').doc(postId).collection('likes');
    if(islike){
      await likesCollection.doc(email).delete();
    }else{
      await likesCollection.doc(email).set({});
    }
   }


}