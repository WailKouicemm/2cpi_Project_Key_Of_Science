import 'package:flutter/material.dart';
const Color KdefaultColor = Color(0xFF2958F5);
const Color KbackgroundColor = Color(0xFFF2F2F2);
const Color Kselect = Color.fromARGB(255, 5, 24, 85);
Text logo = const Text(
  "KEYEINCE",
  style: TextStyle(
      color: KdefaultColor,
      fontSize: 24,
      fontWeight: FontWeight.bold,
      fontFamily: "Montserrat"),
);
AppBar buildAppBar = AppBar(
  flexibleSpace: Container(
    decoration:  const BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/images/backround.png") , fit: BoxFit.cover)
    ),
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