
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/pages/HomeZommDrawer.dart';

import '../components.dart';
import '../kdefault.dart';

class RECOMMANDED_COURSES extends StatefulWidget {
  const RECOMMANDED_COURSES();

  @override
  _RECOMMANDED_COURSESState createState() => _RECOMMANDED_COURSESState();
}

class _RECOMMANDED_COURSESState extends State<RECOMMANDED_COURSES> {
  
  @override
  Widget build(BuildContext context) {
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Kdefault.KbackgroundColor,
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration:  const BoxDecoration(
      //         image: DecorationImage(image: AssetImage("assets/images/backround_appbar.png") , fit: BoxFit.cover)
      //     ),
      //   ),
      //   title: const Text("KEYEINCE"),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   actions: const [
      //     CircleAvatar(
      //       backgroundColor: Kdefault.KdefaultColor,
      //       maxRadius: 3,
      //     ),
      //      SizedBox(width: 3,),
      //     CircleAvatar(
      //       backgroundColor: Kdefault.KdefaultColor,
      //       maxRadius: 3,
      //      child:   CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
      //     ),
      //      SizedBox(width: 3,),
      //     CircleAvatar(
      //       backgroundColor: Kdefault.KdefaultColor,
      //       maxRadius: 3,
      //       child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
      //     ),
      //      SizedBox(width: 10,),
      //   ],
      // ),
      body: Padding(
        padding: const  EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          shrinkWrap: true,
     //     crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// the old recommeneted text
            /*
             Container(
                  height: 60 ,
                  width: widh*0.5,
                  margin: const  EdgeInsets.symmetric(vertical: 20,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const  [
                      Text("Recommended " , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , fontFamily: "Montserrat"),),
                      Text(" courses" , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , fontFamily: "Montserrat"),),
                    ],
                  ) ,
                ),
             */
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60 ,
                  width: widh*0.5,
                  margin: const  EdgeInsets.symmetric(vertical: 20,),
                  child: const AutoSizeText(
                    "Recommanded courses" ,
                    maxLines: 2,
                    minFontSize: 20,
                    maxFontSize: 50,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontFamily: "Montserrat",
                    ),
                  ),
                ),
                TextButton(
                    onPressed: ()=> Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  const HommePage() ),
                    ),
                    child: const Text("Skip",
                    style: TextStyle(
                      color: Kdefault.KdefaultColor,
                      fontSize: 14
                    ),),
                ),
              ],
            ),
            CorsesListView(coursess: populaCorses,ontap: (){},),
          ],
        ),

      ),
    );

  }
}