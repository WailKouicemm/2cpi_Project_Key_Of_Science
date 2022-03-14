import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';


class ScheduleScreen extends StatefulWidget {
   ScheduleScreen({ Key? key }) : super(key: key);

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final sundayday = DaysPreferred(text: 'Sunday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final mondayday = DaysPreferred(text: 'Monday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final tuesdayday = DaysPreferred(text: 'Tuesday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final wednesdayday = DaysPreferred(text: 'Wednsday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final thursdayday = DaysPreferred(text: 'Thursday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final fridayday = DaysPreferred(text: 'Friyday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
  final saturdayday = DaysPreferred(text: 'Saturday', couleur: Colors.white, boxcouleur: Color.fromRGBO(42,88,244,1),);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        flexibleSpace:
          Container( 
            decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bar.png.png'), 
              fit: BoxFit.cover,
              )
           )
          ),
        backgroundColor: Colors.grey[500],
        title: Text('KEYEINCE', style: TextStyle(fontSize: 22.0, color: Color.fromRGBO(42,88,244,1), fontWeight: FontWeight.bold),),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  minRadius: 4.0,
                  backgroundColor: Color.fromRGBO(42,88,244,1),
                ),
                SizedBox(width:1.0),
                CircleAvatar(
              minRadius: 4.0,
              backgroundColor: Color.fromRGBO(42,88,244,1),
            ),
             SizedBox(width:1.0),
             CircleAvatar(
              minRadius: 4.0,
              backgroundColor: Color.fromRGBO(42,88,244,1),
            ),
            SizedBox(width:1.0),
             Container(
               height: 8.2,
               width: 8.2,
               decoration: BoxDecoration(
                   color: Color.fromRGBO(42,88,244,1),
                   borderRadius: BorderRadius.circular(100),
                   border: Border.all(color: Color.fromRGBO(42,88,244,1), width: 1.3)
               ),
               child: CircleAvatar(
                minRadius: 3.0,
                backgroundColor: Colors.white,
            ),
             )
              ],
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[100]
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 35.0),
                child: Column( 
                crossAxisAlignment:CrossAxisAlignment.start,  
                children : [
                SizedBox(height:43.0),
                Text('Schedule' , style: TextStyle(fontSize: 27.0, fontWeight: FontWeight.bold),),
                SizedBox(height:15.0),
                Text('if you want to get table of time for', style: TextStyle(color: Colors.grey),),
                Text('organizing your lessons time. you',style: TextStyle(color: Colors.grey, letterSpacing:0.1),),
                Text('sould answer some questions',style: TextStyle(color: Colors.grey, letterSpacing: 1.0),),
                SizedBox(height: 34.0,),
                Text('How many hours you will reserve for', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                Text('your course', style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                ],
                ),
              ),
              SizedBox(height: 15.0,),
              answerfield(text: 'add your answer'),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0,
                ),
                child: Text('How many Days do you prefer to learn' , style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height:15.0),
              answerfield(text: 'add your answer'),
              SizedBox(height: 15.0,),
              Padding(
                padding: const EdgeInsets.only(
                  left: 35.0
                ),
                child: Text('Select you preferred Days to learn' , style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 25.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    sundayday,
                    mondayday,
                    tuesdayday,
                ],
                ),
              ),
              SizedBox(height: 20.0,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                   wednesdayday,
                   thursdayday,
                   fridayday
                ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 43.5,
                ),
                child: saturdayday,
                ),
              Padding(
                   padding: const EdgeInsets.only(
                     top: 30.0,
                     left: 20.0,
                     right: 20.0
                   ),
                   child: Column(
                     children: [
                       Container(
                          decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30.0)
                                 ),
                          height: 45.0,
                          width: double.infinity,
                          child: FloatingActionButton.extended(
                               elevation: 0.0,
                               onPressed: (){}, 
                               shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)
                                  ),
                               label: Text('Confirm', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                               backgroundColor: Color.fromRGBO(42,88,244,1)
                               )
                               ),
                        SizedBox(height: 20.0,),
                        Container(
                          decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(10.0),
                                 border: Border.all(color: Color.fromRGBO(42,88,244,1), width: 2.0)
                                 ),
                          height: 45.0,
                          width: double.infinity,
                          child: FloatingActionButton.extended(
                                     elevation: 0.0,
                                     onPressed: (){}, 
                                     shape: RoundedRectangleBorder(
                                       borderRadius: BorderRadius.circular(10.0),
                                     ),
                                     label: const Text('Skip', style: TextStyle(color: Color.fromRGBO(42,88,244,1), fontWeight: FontWeight.bold),),
                                     backgroundColor: Colors.white),
                        ),
                        SizedBox(height: 20.0,)
                     ],
                   ),
                 ),
                        ],
                      ),
        ),
                  ),
            );
  }
}