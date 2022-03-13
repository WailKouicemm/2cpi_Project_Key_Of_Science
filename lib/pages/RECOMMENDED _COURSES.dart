
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';






class RECOMMANDED_COURSES extends StatefulWidget {
  const RECOMMANDED_COURSES({ Key? key }) : super(key: key);

  @override
  _RECOMMANDED_COURSESState createState() => _RECOMMANDED_COURSESState();
}

class _RECOMMANDED_COURSESState extends State<RECOMMANDED_COURSES> {
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container 
        (child:Container(
          
          decoration: BoxDecoration(
            
            image: DecorationImage(image: AssetImage("assets/images/backround.png") , fit: BoxFit.cover)
          ),
        ) ,),
        title: logo,
        backgroundColor: Colors.white,
        actions: [
          
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
          ),
          SizedBox(width: 3,),
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
           child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
          ),
          SizedBox(width: 3,),
          CircleAvatar(
            backgroundColor: KdefaultColor,
            maxRadius: 3,
            child: CircleAvatar(backgroundColor: Colors.white, maxRadius: 2,),
          ),
          SizedBox(width: 10,),
        ],
      ),
      backgroundColor: KbackgroundColor,

      body: Padding(
        padding: EdgeInsets.only(left: 30 , right: 30 , ),
        child: ListView(
          shrinkWrap: true,
     //     crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Recommended " , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , fontFamily: "Montserrat"),),
                 Text(" courses" , style: TextStyle(fontSize: 23 , fontWeight: FontWeight.bold , fontFamily: "Montserrat"),),

                ],
              ) ,
             height: 60 ,
             width: widh*0.5,
              margin: EdgeInsets.symmetric(vertical: 20,),
              
               ),
            CorsesListView(coursess:populaCorses,ontap: (){},),
            
          ],
        ),
      ),
    );
  }
}