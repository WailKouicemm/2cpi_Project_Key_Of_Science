import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/models/PinputModel.dart';
import 'package:pinput/pinput.dart';

class CheckMail extends StatefulWidget {
  const CheckMail({ Key? key }) : super(key: key);

  @override
  State<CheckMail> createState() => _CheckMailState();
}

class _CheckMailState extends State<CheckMail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Image(
              image: AssetImage('assets/images/google.png'),
              height: 150.0,
              ),
              SizedBox(height: 50.0,),
              Text('Check your mail' , style:TextStyle(fontSize: 24.0 , fontWeight: FontWeight.w600),),
              SizedBox(height: 10.0,),
              Text('Enter code of verification' , style:TextStyle(fontSize: 19.0 , fontWeight: FontWeight.w200),),
              SizedBox(height: 30.0,),
              buildPinPut(),
              SizedBox(height: 30.0,),
               Container(
              width: 380.0,
              child: FloatingActionButton.extended(
                                   elevation: 0.0,
                                   onPressed: (){}, 
                                   shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0)
                                      ),
                                   label: Text('Continue', style: TextStyle(color: Colors.white , fontSize: 14.0, fontWeight: FontWeight.bold),),
                                   backgroundColor: Color.fromRGBO(42,88,244,1)),
            ),
            Spacer()
            ],
          ),
        ),
      
    );
  }
}