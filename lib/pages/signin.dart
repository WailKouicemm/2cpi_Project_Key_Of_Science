
import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/pages/login.dart';
import 'package:keyofscience/pages/preferredcourses.dart';


class RegisterPage extends StatelessWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height ;
    double width = MediaQuery.of(context).size.width ;
    return Scaffold(
      backgroundColor: KbackgroundColor,
      appBar: appBar,
      
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
        
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Firstly, let's get your " , 
                 style: TextStyle(color: Colors.black , fontSize: 30 , fontWeight: FontWeight.bold,fontFamily: "Montserrat"
                ),
                  ),
                  TextSpan(
                    text: "details" , 
                 style: TextStyle(color: Colors.white , backgroundColor: KdefaultColor ,fontSize: 30 , fontWeight: FontWeight.bold,fontFamily: "Montserrat"
                ),
                  )
                ]
              ),
                ),
                SizedBox(height: 10,),
                Container(child: Text("add your e-mail adresss and password to create your account" , style: TextStyle(color: Colors.grey , fontFamily: "Montserrat"),),
          height: 50,
          width: width * 0.5 ,
      
          
          ),
              ],
            ),
            padding: EdgeInsets.only(top: height * 0.07 , right: width * 0.28 , bottom: height * 0.02 , left: 20),
      
          ),
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 20) ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormFiledC(text: " Full name",icon: Icon(null)),
                TextFormFiledC(text: ' E-mail', icon: Icon(null),),
                TextFormFiledC(suffixicon: true,obscured: true,text: ' Password',icon: Icon(null)),
                TextFormFiledC( suffixicon: true,obscured: true,text: ' Confirm Password',icon: Icon(null) , padding: 20,),
                
                Row(
                  children: [
                    Icon(Icons.check_box , color: KdefaultColor,size: 15,),
                    Text(
                         '  I confirmed i have read the',
                        style: TextStyle(color: Colors.black87 , fontSize: 12,fontFamily: "Montserrat")
                      ),
                   TextButton(
                     onPressed: (){},
                     child: Text(
                          'privacy Acknowledgent ',
                          style: TextStyle(color: KdefaultColor , fontWeight: FontWeight.bold , fontSize: 12,fontFamily: "Montserrat")
                        ),
                   )
                  ],
                ),
                SizedBox(height: 20,),
                 LoginButton(text: 'SIGN UP', onpressed: (){
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  PreferredCourses()),
  );

                 },),
                 SizedBox(height: height * 0.065,),
                 
              ],
              
            ),
            ) ,

               Container(
                   
                   decoration: BoxDecoration(
                     boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0), 
                    blurRadius: 6.0,
                  ),
                ],

                     color: Colors.white,
                     borderRadius: BorderRadius.only(topLeft: Radius.circular(30) , topRight: Radius.circular(30))
                   ),
                   width:double.infinity,
                   alignment: Alignment.center,
                   height: height * 0.08,
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text("Already have account" , style: TextStyle(color: KdefaultColor , fontFamily: "Montserrat"),),
                       

                       TextButton(
                     onPressed: (){
                       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );

                     },
                     child: Text(
                          '? LOGIN ',
                          style: TextStyle(color: KdefaultColor , fontWeight: FontWeight.bold , fontSize: 12 , fontFamily: "Montserrat")
                        ),),
                     ],
                   ),
                 ),
       
        ],
        
      
      ),
    );
  }
}


