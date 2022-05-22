import 'package:flutter/material.dart';
import 'package:get/get.dart';
const Color KdefaultColor = Color(0x3657EC);
const Color KbackgroundColor = Color(0xFFF2F2F2);
const Color Kselect = Color(0xF1C98);
Text logo = const Text(
  "KEYEINCE",
  style: TextStyle(
      color: KdefaultColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Montserrat"),
);
AppBar buildAppBar(String titlebar,{bool? displayBackIcon}) => AppBar(
  backgroundColor: Colors.white,
  elevation: 0.0,
  leading: BackButton(
      color: Colors.black
  ),
  titleSpacing: 0.0,
  title:  Text(titlebar,
    style: TextStyle(
        color: Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.bold,
        fontFamily: "Montserrat"),
  ),
  centerTitle: true,
);
AppBar buildAppBarRegistration = AppBar(
  flexibleSpace: Stack(
    children:<Widget> [
      Container( decoration:  const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/images/backround-appbar.jpg") , fit: BoxFit.cover)
      ),
      ),
      Container(
         child : IconButton(icon: Icon(Icons.cancel_presentation),
         onPressed: () {},),
      ),
    ],
  ),
  title: logo,
  backgroundColor: Colors.white,
  actions: const [
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
    ),
    SizedBox(width: 3,),
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
      child:   CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
    ),
    SizedBox(width: 3,),
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
      child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
    ),
    SizedBox(width: 10,),
  ],
);
Widget ImageCourse(String sourceimage) => Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image:  DecorationImage(
            image: AssetImage(sourceimage),
            fit: BoxFit.fill,
          ),
        ),
      );