import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:keyofscience/services/post_services.dart';



class postsPage_modelView extends ChangeNotifier{

  bool isLoading = false;
  List<Post> postsList = [];
  int documentLimit = 5;
  bool hasMore = true;
  Future<void> getPosts()async{
    if(!isLoading && hasMore){
     try{
       isLoading=true;
       notifyListeners();
       final List<Post> _newList = await postSevices.getPosts(documentLimit,postsList.isEmpty);
       print("getPosts service completed");
       if(_newList.length<documentLimit) {
          hasMore = false;
         }
       postsList.addAll(_newList);
       isLoading=false;
       notifyListeners();
     }on FirebaseException catch(Exception) {
       print("Exeption in getPosts $Exception");
     }catch (error){
       print("error on catch of getPosts => $error");
       if(error.toString().contains("Bad state: No element")){
         hasMore = false;
         isLoading = false;
         notifyListeners();
       }
     }
    }
  }

  Future<String> getUsername(String uid)async{
  final String Username = await AuthService.getUsername(uid);
  return Username;
  }


static Future<void> likePost(String postId)async{
  try{
    await postSevices.like(postId: postId);
  }catch (_){}
}



}