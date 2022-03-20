import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../kdefault.dart';
import '../pages/Grey_text.dart';


class Allertdialog extends StatelessWidget {
  const Allertdialog();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AlertDialog(
      insetPadding: const EdgeInsets.all(25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      content: Container(
        height: height/3.5,
        width: width-50,
        decoration: BoxDecoration(
          color: const Color(0xffefefef),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(10),
        child: const Grey_text(text: " write here what you want to post "),
      ),
      actionsPadding: const EdgeInsets.all(5),
      title: const Text("Add Post",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
      actions: [
        FloatingActionButton(
          backgroundColor: KdefaultColor,
          onPressed: ()=>Navigator.pop(context),
          child: SvgPicture.asset(
            "assets/icons/post.svg",
            color: Colors.white,
          ),
        )
      ],
    );

  }
}


