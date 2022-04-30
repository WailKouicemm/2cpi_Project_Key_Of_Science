import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/OnBoarding/View/onBoearingScreen.dart';
import 'package:keyofscience/presentation/Login/View/login.dart';
import 'package:keyofscience/presentation/Register/viewModel/RegisterViewModel.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/services/Authenctication.dart';

import '../../resources/ColorManager.dart';
import '../../resources/values_manager.dart';

import 'package:provider/provider.dart';



class RegisterPage extends StatelessWidget {
  const RegisterPage();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration:  const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(images.appBarImage),
                  fit: BoxFit.cover)),
        ),
        title: const Text(app.appName),
      ),
      body: ListView(
        physics: const ScrollPhysics(),
        scrollDirection: Axis.vertical,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(
                // top: height * 0.07 ,
                // right: width * 0.28 ,
                // bottom: height * 0.02 ,
                  top: AppPadding.p20,
                  right: width * 0.28,
                  bottom: AppPadding.p10,
                  left: AppPadding.p10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: appStrings.registertitle1 ,
                              style: Theme.of(context).textTheme.headline1
                            /*
                              TextStyle(color: Colors.black ,
                                fontSize: 30 ,
                                fontWeight: FontWeight.bold,fontFamily: "Montserrat"),
                               */
                          ),
                           TextSpan(
                            text: appStrings.registertitle2 ,
                            style: Theme.of(context).textTheme.headline3
                            // TextStyle(
                            //     color: Colors.white ,
                            //     backgroundColor: Kdefault.KdefaultColor ,
                            //     fontSize: 30 ,
                            //     fontWeight: FontWeight.bold,
                            //     fontFamily: "Montserrat"
                            // ),
                          )
                        ]
                    ),
                  ),
                  const  SizedBox(height: AppHeight.h10,),
                  SizedBox(
                    height: AppHeight.h50,
                    width: width * 0.5 ,
                    child: Text(
                      appStrings.registerSubtitle,
                      style: Theme.of(context).textTheme.caption,
                      // style: TextStyle(
                      //     color: Colors.grey ,
                      //     fontFamily: "Montserrat"
                      // ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          /// textFormFields + register Button
          const TextFormFields(),

          /// Login button
          Container(
                decoration:  const  BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.grey,
                        offset: Offset(AppOffset.off0_0, AppOffset.off1_0),
                        blurRadius: AppRadius.r6,
                      ),
                    ],
                    color: ColorManager.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.r30) ,
                      topRight: Radius.circular(AppRadius.r30),
                    )
                ),
                width:double.infinity,
                alignment: Alignment.center,
                height :   height * 0.08,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(appStrings.haveAccount ,
                      style: Theme.of(context).textTheme.headline2,
                      // style: TextStyle(color: Kdefault.KdefaultColor , fontFamily: "Montserrat"),
                    ),
                    TextButton(
                      onPressed: ()=> Navigator.pushReplacement(context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      ),
                      child: const Text(appStrings.login),
                    ),
                  ],
                ),

            ),
        ],
      ),
    );
  }
}


class TextFormFields extends StatefulWidget {
  const TextFormFields({Key? key}) : super(key: key);

  @override
  State<TextFormFields> createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
 late TextEditingController nameTextEdetingController;
 late TextEditingController emailTextEdetingController;
 late TextEditingController passwordTextEdetingController;
 late TextEditingController confirmPasswordTextEdetingController;
 bool inVisible=true;
  final auth = FirebaseAuth.instance;

  @override
  void initState() {
     nameTextEdetingController = TextEditingController();
     emailTextEdetingController = TextEditingController();
     passwordTextEdetingController = TextEditingController();
     confirmPasswordTextEdetingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameTextEdetingController.dispose();
    emailTextEdetingController.dispose();
    passwordTextEdetingController.dispose();
    confirmPasswordTextEdetingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final authService = Provider.of<AuthService>(context);
    return Padding(
      padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p20) ,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// name
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p30),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: nameTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                 decoration: const InputDecoration(

                  hintText: " Full name"
                ),
                validator: (value)=>validator.nameValidator(value?? ""),
              ),
            ),
            /// Email
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p30),
              child: TextFormField(
                style: TextStyle(color: Colors.black),
                controller: emailTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                decoration: const InputDecoration(
                  hintText: ' E-mail',
                ),
                validator: (value)=>validator.emailValidator(value?? ""),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
            StatefulBuilder(
              builder: (_,setstate){
                return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ///Password
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p30),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: passwordTextEdetingController,
                          cursorColor: ColorManager.defaultColor,
                          decoration:  InputDecoration(
                            hintText: ' Password',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child: Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility)),
                          ),
                          validator: (value)=>validator.passwordlValidator(value?? ""),
                          obscureText: inVisible,
                          keyboardType: TextInputType.visiblePassword,
                        ),
                      ),
                      ///Confirm Password
                      Padding(
                        padding: const EdgeInsets.only(bottom: AppPadding.p20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.black),
                          controller: confirmPasswordTextEdetingController,
                          cursorColor: ColorManager.defaultColor,
                          decoration:  InputDecoration(
                            hintText: ' Confirm Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child : Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),

                          ),
                          validator: (value)=>validator.confirm_pass_Validator(value?? "" , passwordTextEdetingController.text),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: inVisible,
                        ),
                      ),
                    ]
                );
              },
            ),
            /// privacy text
            Row(
              children: [
               // const  Icon(Icons.check_box , color: Kdefault.KdefaultColor,size: 15,),
                Checkbox(
                    value: true,
                    onChanged: (value){}
                ),
                Text(
                  appStrings.privacy1,
                  style: Theme.of(context).textTheme.caption,
                  //  style: TextStyle(color: Colors.black87 , fontSize: 12,fontFamily: "Montserrat"),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: (){
                    },
                    child: const AutoSizeText(
                      appStrings.privacy2,
                      maxLines: 1,
                      minFontSize: 5,
                      maxFontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const  SizedBox(height: AppHeight.h20,),
            SizedBox(
              width: width,
              child: ElevatedButton(
                onPressed: ()async{
                 if( _formKey.currentState!.validate()){
                  await authService.SignUpWithEmailPasssword(emailTextEdetingController.text, passwordTextEdetingController.text);
                  Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) =>  const  onBoardingScreen()),
                  );}
                },
                child: const Text(
                  appStrings.signUp,
                ),
              ),
            ),
            // LoginButton(text: 'SIGN UP', onpressed: (){
            //   Navigator.push(context,
            //     MaterialPageRoute(builder: (context) =>  const  PreferredCourses()),
            //   );
            // },),
            SizedBox(height: height * 0.065,),

          ],
        ),
      ),
    );
  }
}
