import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:keyofscience/services/comments_services.dart';

import '../../../../models/Models.dart';


class comments_viewModel extends ChangeNotifier{

  List<comment> comments = [];
  final int documentLimit = 10;
  bool isLoading = false;
  bool hasMore = true;

  Future<void> getComments(String postId)async{
    if(!isLoading && hasMore){
      isLoading = true;
      notifyListeners();
    try{
      final String uid = FirebaseAuth.instance.currentUser!.uid;
      final List<Map<String, dynamic>> li = await comments_service.getCommentsFromFirebase(documentLimit, comments.isEmpty,postId);
      if(li.length<documentLimit) {
        hasMore = false;
      }
        for(int i=0;i<li.length;i++){
          final element = li[i];
          user userr = await AuthService.getUser(element['email']);
          comments.add(comment.fromJson(element,userr));
          print("elemant element['email'] ${element['email']}");
        }

      notifyListeners();
      // li.forEach((element) async {
      //   final user userr = await AuthService.getUser(element['email']);
      //
      // });
    }catch (error){
      print("error in getComments $error");
      if(error.toString().contains("Bad state: No element")){
        hasMore = false;
        isLoading = false;
        notifyListeners();
      }
      }finally{
      isLoading = false;
      notifyListeners();
    }
    }
  }

  bool isAddingCooment = false;
  Future<void> addComment({required String content,required postId}) async{
    if(!isAddingCooment){
      isAddingCooment = true;
      try{
        print("addCommentaddCommentaddComment");
        await comments_service.sendCommentToFirebase(postID: postId,content: content);
      }catch (error){
        print("error in addComment $error");
      }
      isAddingCooment = false;
    }
  }


}