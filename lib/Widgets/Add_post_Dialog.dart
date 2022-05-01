import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../presentation/resources/Styles_Manager.dart';


class Allertdialog extends StatelessWidget {
  const Allertdialog();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return AlertDialog(
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
          ),
        )
      ],
    );
  }
}


