
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';

import '../../../components.dart';
import '../../main/main_view.dart';
import '../../resources/FontsManager.dart';
import '../../resources/values_manager.dart';

class RECOMMANDED_COURSES extends StatefulWidget {
  const RECOMMANDED_COURSES();

  @override
  _RECOMMANDED_COURSESState createState() => _RECOMMANDED_COURSESState();
}

class _RECOMMANDED_COURSESState extends State<RECOMMANDED_COURSES> {
  
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;
    return Padding(
        padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p15),
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: widh*0.5,
                      margin: const  EdgeInsets.symmetric(vertical: AppMargin.m20,),
                      child: AutoSizeText(
                          AppStrings.recommanded_courses ,
                          maxLines: 2,
                          minFontSize: FontSizeManager.s30,
                          maxFontSize: FontSizeManager.s50,
                          style: Theme.of(context).textTheme.headline1
                        // TextStyle(
                        //     fontWeight: FontWeight.w900,
                        //     fontFamily: "Montserrat",
                        // ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: ()=> Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const HomePage() ),
                    ),
                    child: Text(AppStrings.skip,
                      style: Theme.of(context).textTheme.headline6!.copyWith(color: ColorManager.white),
                      // style: TextStyle(
                      //   color: Kdefault.KdefaultColor,
                      //   fontSize: 14
                      // ),
                    ),
                  ),
                ],
              ),

            CorsesListView(coursess: populaCorses,ontap: (){},),
          ],
        ),

      );

  }
}