
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';

//import 'HomeZommDrawer.dart';

class RECOMMANDED_COURSES extends StatefulWidget {
  const RECOMMANDED_COURSES();

  @override
  _RECOMMANDED_COURSESState createState() => _RECOMMANDED_COURSESState();
}

class _RECOMMANDED_COURSESState extends State<RECOMMANDED_COURSES> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: buildAppBar,
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
                   onPressed: () {} ,   //=> Navigator.push(
                //      context,
                   //   MaterialPageRoute(
                    //      builder: (context) => const HommePage()),
               //     ),
                    child: const Text("Skip",
                    style: TextStyle(
                      color: KdefaultColor,
                      fontSize: 14
                    ),),
                ),
              ],
            ),
            CorsesListView(coursess:populaCorses,ontap: (){},),
          ],
        ),

      ),
    );

  }
}


