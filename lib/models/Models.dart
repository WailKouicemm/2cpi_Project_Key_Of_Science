import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class user {
  final String username,email,image;

  user({required this.username,required this.email,required this.image});

  factory user.fromJson(Map<String,dynamic> json){
    return user(
      username: json['username'],
      email: json['email'],
      image: json['image'] ?? '',
    );
  }

}
class course {
  final String image;

  final String title;

  final String lessonsNumber;

  final String creator;

  const course(
      {required this.image, required this.title, required this.lessonsNumber, this.creator = "Salah eddine"});
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

class comment {
  final String content;
  final String id;
  final user userr;
  final bool isLiked;

  comment({required this.userr,required this.content,required this.id,required this.isLiked});

  factory comment.fromJson(Map<String,dynamic> json,user userr,String id,bool isLiked){
    return comment(
        content: json['content'],
        userr: userr,
        id: id,
      isLiked: isLiked
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



class Keyeince_features_item {
  final String name;
  final IconData logo;
  final page;

  const Keyeince_features_item(
      {required this.page, required this.name, required this.logo});
}


class Post {
  final String title, content, id, email;
  List<String> images ;
 final Timestamp date;
  final user userr;
   bool isLiked;
  final int nbLikes;

  Post( {required this.title, required this.content, required this.id,
    required this.email,required this.date, required this.images,
    required this.userr,required this.isLiked,required this.nbLikes});

  factory Post.fromJson(Map<String, dynamic> map,user userr,bool isLiked,int nbLikes){
    List<String> _images=[];
    map["images"].forEach((e){
      _images.add(e.toString());
    });
    return Post(
        title: map["title"] ?? "",
        content: map["content"]?? "",
        id: map["id"]?? "",
        email: map["email"]?? "",
        date: map["date"]?? "",
        images: _images,
        userr : userr,
        isLiked : isLiked,
        nbLikes: nbLikes
    );
  }

}

class Book{
  final String title,description,image,link,creator;

  const Book({required this.title,required this.description,required this.image,required this.link,required this.creator});
}