import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../FontsManager.dart';
import '../models/Models.dart';
import '../presentation/resources/Styles_Manager.dart';



class Cours_card extends StatelessWidget {
  final course cours;
  const Cours_card({required this.cours});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: null,
      child: Stack(
        children: [
          Container(
            width:  width * 0.8,
            margin: const EdgeInsets.only(right: AppMargin.m10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(
                  image: AssetImage("assets/images/java.jpg"),
                  fit: BoxFit.cover,
              ),
              borderRadius:BorderRadius.circular(AppRadius.r15),
            ),
          ),
          Container(
              width:  width * 0.8,
              margin:  const EdgeInsets.only(right: AppMargin.m10),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppRadius.r15),
                  color: Colors.black.withOpacity(0.4),
              ),
              child: Container(
                padding: const EdgeInsets.only(left: AppPadding.p15 , bottom: AppPadding.p15),
                width:  width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cours.title ,
                      style: Theme.of(context).textTheme.subtitle1?.
                      copyWith(fontSize: FontSizeManager.s12),
                    ),
                    Text(cours.coursesnum ,
                      style: lightStyle(color: ColorManager.grey, fontSize: FontSizeManager.s10),),
                    InkWell(
                      onTap: (){},
                      child: Container(
                          padding: const EdgeInsets.all(AppPadding.p1),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppRadius.r10),
                            color: ColorManager.pink,
                          ),
                          child: Text(' continue ' ,
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
