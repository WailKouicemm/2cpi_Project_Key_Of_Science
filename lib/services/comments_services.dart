

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';


class comments_service{
  static final _firestoreInstance =  FirebaseFirestore.instance;
  static DocumentSnapshot? startAfter;


  static Future<void> sendCommentToFirebase({required String content, postID})async{
   try{
     await _firestoreInstance.collection('comments').doc(postID).collection('comments').doc().set({
         "content": content,
         "email": FirebaseAuth.instance.currentUser!.email,
         'date': Timestamp.now()
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
      if(setSTARTAFTERtoNull) startAfter=null;
      List<Map<String, dynamic>> list= [];
      final QuerySnapshot<Map<String, dynamic>> res;
      if(startAfter == null){
        res = await _firestoreInstance.collection('comments').doc(postId).collection('comments').orderBy("date",descending: true).limit(documentLimit).get();
      }else{
        res = await _firestoreInstance.collection('comments').doc(postId).collection('comments').orderBy("date",descending: true).startAfterDocument(startAfter!).limit(documentLimit).get();
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
}