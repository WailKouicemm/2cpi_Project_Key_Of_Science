import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/services/Authenctication.dart';
import 'package:keyofscience/services/comments_services.dart';

import '../../../../models/Models.dart';


class comments_viewModel extends ChangeNotifier{
  List<comment> comments = [];
  final int documentLimit = 10;
  bool isLoading = false;
  bool hasMore = true;
  CancelableOperation? cancellableOperation_getComments;

  close(){
    print("closecloseclosecloseclose called");
    comments.clear();
     isLoading = false;
     hasMore = true;
    cancellableOperation_getComments!.cancel();
  }




  Future<void> _getcommetns(String postId)async{
    print("_getcommetns_getcommetns_getcommetns_getcommetn !isLoading ${!isLoading} && hasMore $hasMore");
    if(true){ // !isLoading && hasMore
      isLoading = true;
      notifyListeners();
      try{
        print("comments_servicecomments_service");
        final List<Map<String, dynamic>> li = await comments_service.getCommentsFromFirebase(documentLimit, comments.isEmpty,postId);
        if(li.length<documentLimit) {
          hasMore = false;
        }
        for(int i=0;i<li.length;i++){
          final element = li[i];
          user userr = await AuthService.getUser(element['email']);
          bool isLiked = await comments_service.isLike(postId: postId, commentId: element['id']);
          comments.add(comment.fromJson(element,userr,element['id'],isLiked));
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
        }
      }finally{
        isLoading = false;
        notifyListeners();
      }
    }
  }

  Future<void> getComments(String postId)async{
    cancellableOperation_getComments = CancelableOperation.fromFuture(
        _getcommetns(postId),
      onCancel: () => {print('onCancel _getcommetns_getcommetns_getcommetns_getcommetns_getcommetns')},
    );

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

  static Future<void> likeComment({required String  postId,required String commentId})async{
    try{
      await comments_service.likeComment(postId: postId,commentId: commentId);
    }catch (_){}
  }
}