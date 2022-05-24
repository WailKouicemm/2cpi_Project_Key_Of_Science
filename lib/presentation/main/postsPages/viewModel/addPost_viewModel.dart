import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:async/async.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyofscience/Widgets/AwesomeMessag.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/presentation/main/postsPages/viewModel/PostsPage_viewModel.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/services/addPostTOfirebase.dart';
import 'package:uuid/uuid.dart';

class addpost_viewModel extends postsPage_modelView {

   List<XFile>  pickedImages = [];
   bool isUploading = false;

   close(){
     print("closecloseclosecloseclose called");
     pickedImages.clear();
     isUploading = false;
   }

  Future<void> pickeImages_fromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage(
      imageQuality: 50 // %
    );

    if(images!=null){
      pickedImages.addAll(images.toList());
      notifyListeners();
    }
  }


  void removeImage(XFile image){

    pickedImages.remove(image);
    notifyListeners();
  }


  Post _uploadedPost({
    required String title,
    required String id,
    required String content,
    required List<String> imagesUrl}){
   return Post(title: title,
      content: content,
      id: id,
      email: FirebaseAuth.instance.currentUser!.email?? "",
      date: Timestamp.now(),
      images: imagesUrl,
      userr: user(
          username: FirebaseAuth.instance.currentUser!.displayName ?? "",
          email: FirebaseAuth.instance.currentUser!.email ?? "",
          image: ""),
      isLiked: false,
      nbLikes: 0,
    );


  }
  Future<Post?> uploadPost({required String title,required String content, required BuildContext context})async{
    isUploading = true;
    notifyListeners();
    try{
      final String id = const Uuid().v1();
      final List<String> imagesUrl = await addPostTOfirebase.uploadPost(title, content, pickedImages,id);
      Navigator.of(context).pop();
      AwesomeMessag(context: context, title: AppStrings.done, message: AppStrings.post_succeffuly,type: TipType.COMPLETE);
    return  _uploadedPost(title: title, content: content, imagesUrl: imagesUrl,id: id);
    } on FirebaseException catch (exeption){
    print(exeption);
    } catch (error){
      print(error);
    }
    isUploading = false;
    notifyListeners();
  }


}


class validators{
  static  String? titleValidator(String title){
    return null; /// this is just in test Mode
    if(title.trim().length>10) {
      return null;
    }
    return "the length of the title should be more than 10 letter";
  }
  static  String? contentValidator(String content){
    return null; /// this is just in test Mode
    if(content.trim().isNotEmpty) {
      return null;
    }
    return "the content should not be empty";
  }
}