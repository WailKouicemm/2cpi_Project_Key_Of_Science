import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';

import '../../../../components.dart';
import '../../../resources/FontsManager.dart';
import '../../../resources/Styles_Manager.dart';

import '../../../resources/appStrings.dart';
import '../../../resources/values_manager.dart';
import '../../main_Viewmodel.dart';
import '../../main_view.dart';
class coursesScreen extends StatelessWidget {
  const coursesScreen();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: ColorManager.primaryColor,
        body: SingleChildScrollView(
          child: Column (
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: size.height *0.34,
                    width: double.infinity,
                    color: ColorManager.defaultColor,

                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          maxRadius: 57,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            maxRadius: 55,
                            backgroundColor: Colors.transparent,
                            backgroundImage: AssetImage('assets/images/man.jpg'),
                          ),
                        ),
                        FutureBuilder<String>(
                          future: usernameManage.getUsername(),
                          builder: (_,snapshot)=> Text( (snapshot.data ?? ''),
                              style: boldStyle(color: ColorManager.white,fontSize: FontSizeManager.s20,fontWeight: FontWeight.w700)
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -15,
                    right: -35,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      minRadius: 60,
                    ),
                  ),
                  Positioned(
                    left: -100,
                    top: 50 ,
                    child: CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.2),
                      minRadius: 60,
                    ),
                  ),
                ],
              ),

          Padding(
            padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p25 ),
            child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              Expanded(
                child:
                Container(
                  width:size.width *0.5,
                  margin: const  EdgeInsets.only(bottom: AppMargin.m20,),
                  child: AutoSizeText(
                      AppStrings.YourCourses ,
                      maxLines: 2,
                      minFontSize: FontSizeManager.s20,
                      maxFontSize: FontSizeManager.s20,
                      style: Theme.of(context).textTheme.headline1
                  ),
                ),
              ),

              CorsesListView(coursess: Mycourses,ontap: (){},),
            ],
          ),

        )
            ],
          ),
        ),
      ),
    );
  }
}
