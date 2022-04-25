import 'package:flutter/material.dart';

class course{
  final String path ;
  final String title ;
  final String coursesnum ;
  const course({required this.path,required this.title,required this.coursesnum});
}

class post{
  final String poster_image;
  final String poster_name;
  final String poster_username;
  final String text_of_post;
  const post({required this.poster_image,required this.poster_name,
    required this.poster_username,required this.text_of_post});
}

class VideoModel{
  final String title;
  final Widget iconn;
  VideoModel({
    required this.iconn,
    required this.title,
  });
}