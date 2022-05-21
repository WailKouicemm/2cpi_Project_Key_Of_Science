import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';

import '../../main.dart';
import '../resources/ColorManager.dart';
import '../resources/App.dart';
import '../resources/Styles_Manager.dart';
import '../resources/values_manager.dart';



class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
        Positioned(
          top: 100,
          right: size.width /2 - size.width * 0.7 * 0.5,
          child: Image.asset('assets/images/welcom.png' ,width: size.width * 0.7,),
        ),
          Positioned(
            bottom: 0,
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                color: ColorManager.defaultColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(20) ,topRight: Radius.circular(20))
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: AppPadding.p30 , ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Start your course ,read your'
                          ,style: welcomText,
                        ),
                        Text('favorite book with task '
                          ,style: welcomText,
                        ),
                        Text('management , get solution for  '
                          ,style: welcomText,
                        ),
                        Text('your problems'
                          ,style: welcomText,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: AppPadding.p30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('The more that you read , the more'
                          ,style: welcomText2,
                        ),
                        Text('things you will Know .The more that'
                          ,style: welcomText2,
                        ),
                        Text('you learn , the more places you ll go'
                          ,style: welcomText2,
                        ),
                        Text('your problems'
                          ,style: welcomText2,
                        ),

                      ],
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      elevation: AppElevation.e5,
                      padding: const EdgeInsets.symmetric(vertical : AppPadding.p15 , horizontal:AppPadding.p50 ),
                      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
                      primary: Colors.white,
                      // ColorManager.defaultColor
                    ),
                     onPressed: ()=> Navigator.push(context,
                       MaterialPageRoute(
                         builder: (context) => const loginORregister(),
                       ),
                     ),
                    child: Text(
                      'LET S CHOOSE YOUR COURSE',
                      style: semiBoldStyle(color: ColorManager.defaultColor , fontSize: FontSizeManager.s15),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

