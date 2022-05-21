

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uuid/uuid.dart';


class comments_service{
  static final _firestoreInstance =  FirebaseFirestore.instance;
  static DocumentSnapshot? startAfter;
  static String email = FirebaseAuth.instance.currentUser!.email ?? '';

  static Future<void> sendCommentToFirebase({required String content, postID})async{
   try{
     await _firestoreInstance.collection('comments').doc(postID).collection('comments').doc().set({
         "content": content,
         "email": email,
         'date': Timestamp.now(),
          'id': const Uuid().v1()
     });
     // await _firestoreInstance.doc().collection(postID).doc().set({
     //   "content": content,
     //   "uid": uid,
     //   'date': Timestamp.now()
     // });
   }catch (error){
     throw error;
   }
  }


  static Future<List<Map<String, dynamic>>> getCommentsFromFirebase(int documentLimit,bool setSTARTAFTERtoNull,String postId)async{
    try{
      print("getCommentsFromFirebasegetCommentsFromFirebasegetCommentsFromFirebase");
      if(setSTARTAFTERtoNull) startAfter=null;
      List<Map<String, dynamic>> list= [];
      final QuerySnapshot<Map<String, dynamic>> res;
      if(startAfter == null){
        res = await _firestoreInstance.collection('comments').doc(postId).
        collection('comments').orderBy("date",descending: true).limit(documentLimit).get();
      }else{
        res = await _firestoreInstance.collection('comments').doc(postId).collection('comments')
        .orderBy("date",descending: true).startAfterDocument(startAfter!).limit(documentLimit).get();
      }
      startAfter = res.docs.last;
      for(int i=0;i<res.docs.length;i++){

        list.add(res.docs[i].data());
      }
      return list;
    }catch (error){
      throw error;
    }
  }

  static Future<bool> isLike({required String  postId,required String commentId})async{

    final DocumentSnapshot  res;
    res = await _firestoreInstance.collection('likes').doc(postId).collection('comments_likes').
    doc(commentId).collection("likes").doc(email).get();

    return res.exists;
  }

  static Future<void> likeComment({required String  postId,required String commentId})async{
    try{
      bool islike = await  isLike(postId: postId,commentId: commentId);
      print("this comment is ==> $islike ");
      final likesCollection = _firestoreInstance.collection('likes').
      doc(postId).collection('comments_likes').doc(commentId).collection("likes");
      if(islike){
        await likesCollection.doc(email).delete();
      }else{
        await likesCollection.doc(email).set({});
      }
    }catch (e){
      print("error in like comment $e");
    }
  }



}