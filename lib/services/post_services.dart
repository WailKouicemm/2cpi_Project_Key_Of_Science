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
      for(var item in res.docs){ // int i=0;i<res.docs.length;i++
        final user userr = await AuthService.getUser(item.data()['email'] ?? '');
        final bool isLiked = await isLike(postId: item.data()['id']);
        final int nbLikes = 0; // await NbLikes(item.data()['id']);
        lists.add(
          Post.fromJson(item.data(),userr,isLiked,nbLikes)
        );
        print("for loop item");
      }
      return lists;
    }catch (error){
      throw error;
    }
   }


  static Future<bool> isLike({required String  postId})async{
    final String email = await FirebaseAuth.instance.currentUser!.email ?? '';
    final DocumentSnapshot  res;
      res = await _firestoreInstance.collection('likes').doc(postId)
          .collection('likes').doc(email).get();
    return res.exists;
   }

  static Future<void> like({required String  postId})async{
    try{
      final String email = await FirebaseAuth.instance.currentUser!.email ?? '';
      bool islike = await  isLike(postId: postId);
      final likesCollection = _firestoreInstance.collection('likes').doc(postId).collection('likes');
      if(islike){
        await likesCollection.doc(email).delete();
      }else{
        await likesCollection.doc(email).set({});
      }
    }catch (e){rethrow;}
   }

   static Future<int> NbLikes(String postId)async{
    try{
      int nb =  await _firestoreInstance.collection('likes').
      doc(postId).collection('likes').snapshots().length;
      print("nbnbnbnb $nb");
      return nb;
    }catch (e){
      print("error in nbLikes $e");
    }
    return -1;

   }


}