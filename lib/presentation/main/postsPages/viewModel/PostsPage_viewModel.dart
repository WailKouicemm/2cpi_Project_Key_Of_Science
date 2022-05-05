import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:keyofscience/services/post_services.dart';



class postsPage_modelView extends ChangeNotifier{

  bool isLoading = false;
  List<Post> postsList = [];

  Future<void> getPosts()async{
    print("!isLoading!isLoading ${!isLoading}");
    if(!isLoading){
     try{
       isLoading=true;
       notifyListeners();
       final List<Post> _newList = await postSevices.getPosts();
       postsList.addAll(_newList);
       isLoading=false;
       notifyListeners();
     }catch (error){
       print("getPosts  \n\n\n getPosts \n\n\n $error");
     }
    }
  }

  Future<String> getUsername(String uid)async{
  final String Username = await AuthService.getUsername(uid);
  return Username;
  }




  Future<void> like(String uid)async{

  }

  Future<void> dislike(String uid)async{

  }

}