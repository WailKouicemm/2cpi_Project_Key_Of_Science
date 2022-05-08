import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class course {
  final String image;

  final String title;

  final String coursesnum;

  final String creator;

  const course(
      {required this.image, required this.title, required this.coursesnum, this.creator = "Salah eddine"});
}

class post {
  final String poster_image;
  final String poster_name;
  final String poster_username;
  final String text_of_post;

  const post({required this.poster_image, required this.poster_name,
    required this.poster_username, required this.text_of_post});

  factory post.fromJson(Map<String, dynamic> json){
    return post(
      poster_image: json['image'],
      poster_name: json['name'],
      poster_username: json['username'],
      text_of_post: json['text'],
    );
  }
}

class VideoModel {
  final String title;
  final Widget iconn;

  VideoModel({
    required this.iconn,
    required this.title,
  });
}


class categories {
  final String title;

  categories({required this.title});
}

class courses {
  final String path, title, coursesnum;

  courses({required this.title, required this.path, required this.coursesnum});
}

class bottomNavyItem {
  final String title;
  final String icon_asset;
  final Widget page;

  const bottomNavyItem(
      {required this.title, required this.icon_asset, required this.page});
}

class Userr {
  final String uid;

  final String? email;

  Userr(this.uid, this.email);
}


class Keyeince_features_item {
  final String name;
  final IconData logo;
  final page;

  const Keyeince_features_item(
      {required this.page, required this.name, required this.logo});
}


class Post {
  final String title, content, id, uid;
  List<String> images ;
 final Timestamp date;

  Post({required this.title, required this.content, required this.id, required this.uid,required this.date,required this.images});

  factory Post.fromJson(Map<String, dynamic> map){
    List<String> _images=[];
    map["images"].forEach((e){
      _images.add(e.toString());
    });
    return Post(
        title: map["title"] ?? "",
        content: map["content"]?? "",
        id: map["id"]?? "",
        uid: map["uid"]?? "",
        date: map["date"]?? "",
        images: _images
    );
  }

}