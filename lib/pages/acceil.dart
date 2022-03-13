
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';



class Accueil extends StatefulWidget {
  const Accueil({ Key? key }) : super(key: key);

  @override
  _AccueilState createState() => _AccueilState();
}

class _AccueilState extends State<Accueil> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;

    return Scaffold(
      
      appBar: AppBar(
        elevation: 0,
        leading: Icon(Icons.menu , color: KdefaultColor, ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: logo,
      ),
      backgroundColor: KbackgroundColor,
        body: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20 , top: 15 , bottom:  15),
                    child: profilecard(height: height),
                    
                  ),

                  SizedBox(height: 20,),

                  CorsesListView(coursess:populaCorses, ontap: (){},),
                  

              ],
            ),
          ),
        ),
    );
  }
}

class profilecard extends StatelessWidget {
  const profilecard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    
    return Container(
      padding: EdgeInsets.only(left: 20 , top: 25 , bottom: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi, Mohamed' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
          SizedBox(height: 15,),
         Text('Your reacently coursz : JAVA BASICS' , style: TextStyle(color: Colors.white , ),),
         SizedBox(height: 15,),
         Text('Next lesson : Monday,18 at 13:00' , style: TextStyle(color: Colors.white , ),)

        ],
      ),
      height: height * 0.2,
      width: double.infinity,
      decoration: BoxDecoration(
        color: KdefaultColor,
        borderRadius: BorderRadius.circular(15)
      ),
    );
  }
}





