import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';



class addPostTOfirebase{

  static final _storgeInstance =  FirebaseStorage.instance;
  static final _firestoreInstance =  FirebaseFirestore.instance.collection("posts");

  static Future<void> uploadPost(String title,content,List<XFile>  images ) async{
    try{
      final List<String> imagesUrl = images.isNotEmpty ? await _uploadImages(images) : [];
      await _upload_titleETcontent(title, content, imagesUrl);

    }catch (e){
      throw e;
    }
  }

  static Future<List<String>> _uploadImages(List<XFile> images)async {
    List<String> imagesUrl = [];
    try{
      print("begin _uploadImages");
         for(XFile image in images) {
           final task = _storgeInstance.ref().child(const Uuid().v1()).putFile(File(image.path));
           await task.whenComplete(() async{
             await task.snapshot.ref.getDownloadURL().then((url) => imagesUrl.add(url));
           });
         }
      print("end _uploadImages");
         return imagesUrl;
    }catch (e){
      throw e;
    }
  }

  static Future<void> _upload_titleETcontent(String title,content,List<String> images)async{
    try{
      final String id = const Uuid().v1();
      _firestoreInstance.doc(id).set({
        "title": title,
        "content": content,
        "images": images,
        "date": Timestamp.now(),
        "uid": FirebaseAuth.instance.currentUser!.uid,
        "id": id
      });
      print("end _upload_titleETcontent");
    }catch (e){
      throw e;
    }
  }
}



