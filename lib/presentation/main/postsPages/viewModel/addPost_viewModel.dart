import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyofscience/Widgets/AwesomeMessag.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/services/addPostTOfirebase.dart';

class addpost_viewModel extends ChangeNotifier {
   List<XFile>  pickedImages = [];
   bool isUploading = false;
  Future<void> pickeImages_fromGallery() async {
    final ImagePicker _picker = ImagePicker();
    final List<XFile>? images = await _picker.pickMultiImage();
    if(images!=null){
      pickedImages.addAll(images.toList());
      notifyListeners();
    }
  }


  void removeImage(XFile image){

    pickedImages.remove(image);
    notifyListeners();
  }


  Future<void> uploadPost({required String title,required String content, required BuildContext context})async{
    isUploading = true;
    notifyListeners();
    try{
      await addPostTOfirebase.uploadPost(title, content, pickedImages).whenComplete((){
        Navigator.of(context).pop();
        AwesomeMessag(context: context, title: AppStrings.done, message: AppStrings.post_succeffuly,type: TipType.COMPLETE);
      });
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
    if(title.trim().length>10) {
      return null;
    }
    return "the length of the title should be more than 10 letter";
  }
  static  String? contentValidator(String content){
    if(content.trim().isNotEmpty) {
      return null;
    }
    return "the content should not be empty";
  }
}