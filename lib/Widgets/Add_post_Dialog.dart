import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../kdefault.dart';
import '../pages/Grey_text.dart';
import '../presentation/resources/Styles_Manager.dart';
=======
import 'package:keyofscience/theme/kdefault.dart';

import '../pages/Grey_text.dart';
>>>>>>> origin/main


class Allertdialog extends StatelessWidget {
  const Allertdialog();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AlertDialog(
<<<<<<< HEAD
      insetPadding: const EdgeInsets.all(AppPadding.p25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppPadding.p25),
      ),
      /*
       Container(
        height: height/3.5,
        width: width-50,
        decoration: BoxDecoration(
          color: ColorManager.primaryColor,
          borderRadius: BorderRadius.circular(AppRadius.r12),
        ),
        padding: const EdgeInsets.all(AppPadding.p10),
        child: const Grey_text(text: " write here what you want to post "),
      ),
       */
      content: TextFormField(
        maxLines: 10,
       style: Theme.of(context).textTheme.overline,
       decoration: InputDecoration(
         contentPadding: const EdgeInsets.only(left: AppPadding.p14, bottom: AppPadding.p8, top: AppPadding.p8),
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(AppRadius.r15),
         ),
         filled: true,
         fillColor: ColorManager.primaryColor,
         hintText: " write here what you want to post ",
         hintStyle: lightStyle(color: ColorManager.grey),
         errorStyle: regularStyle(color: ColorManager.error),
         errorMaxLines: 1,
       ),
      ),
      actionsPadding: const EdgeInsets.all(AppPadding.p5),
      title: Text("Add Post",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline5!.copyWith(fontSize: FontSizeManager.s20)
      ),
      actions: [
        FloatingActionButton(
          backgroundColor: ColorManager.defaultColor,
          onPressed: ()=>Navigator.pop(context),
          child: SvgPicture.asset(
            "assets/icons/post.svg",
            color: ColorManager.white
=======
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
>>>>>>> origin/main
          ),
        )
      ],
    );
<<<<<<< HEAD
=======

>>>>>>> origin/main
  }
}


