import 'package:flutter/material.dart';

import '../../../resources/ColorManager.dart';
import '../../../resources/FontsManager.dart';
import '../../../resources/Styles_Manager.dart';

import 'package:flutter/cupertino.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import '../../main_Viewmodel.dart';
import '../../../resources/values_manager.dart';


class Edit extends StatelessWidget {
  const Edit({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
        body:SingleChildScrollView(
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
                padding: EdgeInsets.only(top: 50,left: 20,right: 20,bottom: 60),
                child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("First name",style: TextStyle(fontWeight:FontWeight.w800,fontSize: 13 , color:   Colors.black ),),
                    ),                                       TextFormField(
                      style: const TextStyle(color: ColorManager.black),
                    //  controller: emailTextEdetingController,
                      cursorColor: ColorManager.defaultColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical:14 ),
                        filled: true,
                        fillColor: Color(0xFFEFF2FE),
                        hintText: " E-mail ID",
                        hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                      ),
                     // validator: (value)=>validator.emailValidator(value?? ""),
                    ),

                    SizedBox(
                      height: 25,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("First name",style: TextStyle(fontWeight:FontWeight.w800,fontSize: 13 , color:   Colors.black ),),
                    ),
                    TextFormField(
                      style: const TextStyle(color: ColorManager.black),
                      //  controller: emailTextEdetingController,
                      cursorColor: ColorManager.defaultColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical:14 ),
                        filled: true,
                        fillColor: Color(0xFFEFF2FE),
                        hintText: " E-mail ID",
                        hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                      ),
                      // validator: (value)=>validator.emailValidator(value?? ""),
                    ),

                    SizedBox(
                      height: 25,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("First name",style: TextStyle(fontWeight:FontWeight.w800,fontSize: 13 , color:   Colors.black ),),
                    ),                                       TextFormField(
                  style: const TextStyle(color: ColorManager.black),
                  //  controller: emailTextEdetingController,
                  cursorColor: ColorManager.defaultColor,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical:14 ),
                    filled: true,
                    fillColor: Color(0xFFEFF2FE),
                    hintText: " E-mail ID",
                    hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                    prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                  ),
                  // validator: (value)=>validator.emailValidator(value?? ""),
                ),

                    SizedBox(
                      height: 25,

                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text("First name",style: TextStyle(fontWeight:FontWeight.w800,fontSize: 13 , color:   Colors.black ),),
                    ),                                       TextFormField(
                      style: const TextStyle(color: ColorManager.black),
                      //  controller: emailTextEdetingController,
                      cursorColor: ColorManager.defaultColor,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(vertical:14 ),
                        filled: true,
                        fillColor: Color(0xFFEFF2FE),
                        hintText: " E-mail ID",
                        hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                        prefixIcon: Icon(Icons.email_outlined, color: Colors.grey,),
                      ),
                      // validator: (value)=>validator.emailValidator(value?? ""),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    MaterialButton(
                      onPressed: (){},
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      minWidth: double.infinity,
                      color: ColorManager.defaultColor,
                      child: Text("Save changes",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),


                    )
                  ],
                ),
              )
            ],
          ),
        )
    );;
  }
}
