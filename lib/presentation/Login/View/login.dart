
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:keyofscience/main.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/main/main_view.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/commun/Validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';


import '../../main/homeScreen/view/MainScreen.dart';
import '../../resources/FontsManager.dart';
import '../../resources/Styles_Manager.dart';
import '../../resources/values_manager.dart';
import '../Resetpwd/resetpassword.dart';
import '../ViewModel/login_viewModel.dart';



class Login extends StatefulWidget {
  final PageController pageController;
  const  Login(this.pageController);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return
        MultiProvider(
          providers: [
            ChangeNotifierProvider<loginUser_viewModel>(create:(_)=> loginUser_viewModel())
          ],
          child: Scaffold(
            body: ListView(
              children: [
                SizedBox(height: height*0.2,),
                Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Login' , style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold , fontSize: 30),),
                        SizedBox(height: 10,),
                        Text('sign in to your account and  !' , style: TextStyle(color: Colors.black, ),),
                        Text('enjoy !' , style: TextStyle(color: Colors.black, ),),


                      ],
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: AppPadding.p40 , right: AppPadding.p20 , left: AppPadding.p20),
                  child: TextFormFields(widget.pageController),
                ),


              ],
            ),
          ),
        );
   // );
  }
}




class TextFormFields extends StatefulWidget {
  final PageController pageController;
  const TextFormFields(this.pageController);

  @override
  _TextFormFieldsState createState() => _TextFormFieldsState();
}

class _TextFormFieldsState extends State<TextFormFields> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController emailTextEdetingController;
  late TextEditingController passwordTextEdetingController;


  @override
  void initState() {
    emailTextEdetingController = TextEditingController();
    passwordTextEdetingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailTextEdetingController.dispose();
    passwordTextEdetingController.dispose();
    super.dispose();
  }
  bool inVisible=true;
  @override
  Widget build(BuildContext context) {
    final double widh = MediaQuery.of(context).size.width;
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// E-mail
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p30),
            child: TextFormField(
              style: const TextStyle(color: ColorManager.black),
              controller: emailTextEdetingController,
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
              validator: (value)=>validator.emailValidator(value?? ""),
            ),
          ),

          /// Password
          StatefulBuilder(
            builder: (_,setstate){
              return  Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: TextFormField(
                  style: const TextStyle(color: ColorManager.black),
                  controller: passwordTextEdetingController,
                  cursorColor: ColorManager.defaultColor,
                  decoration:  InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical:14 ),
                    filled: true,
                    fillColor: Color(0xFFEFF2FE),
                    hintText: ' Password',
                    hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                    prefixIcon: Icon(Iconsax.key, color: Colors.grey, ),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setstate(()=>inVisible=!inVisible);
                        },
                        child: Icon(inVisible
                            ? Icons.visibility_off
                            : Icons.visibility, color: Colors.grey ,) , ),
                  ),
                  validator: (value)=>validator.passwordlValidator(value?? ""),
                  obscureText: inVisible,
                  keyboardType: TextInputType.visiblePassword,
                ),
              );
            },
          ),
          /// reset Password
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ResetPasswordPage()),);
                },
                child: const Text(' Forget password  ?',
                  style: TextStyle(color: ColorManager.blue, fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          /// log in button
          SizedBox(
              width: widh,
              child: Selector<loginUser_viewModel , bool>(
                selector: (_,provider)=>provider.isLoading,
                builder: (_,isLoading,__)=> isLoading? const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.defaultColor,
                  ),
                ) :
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                              elevation: AppElevation.e5,
                              padding: const EdgeInsets.all(AppPadding.p15),
                              shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
                              primary: ColorManager.defaultColor,
                              // ColorManager.defaultColor
                            ),
                  onPressed: ()async{
                    if( _formKey.currentState!.validate()){
                   //   Focus.of(context).unfocus();
                      await Provider.of<loginUser_viewModel>(context,listen: false).loginUser(
                          email: emailTextEdetingController.text.trim(),
                          password: passwordTextEdetingController.text.trim(),
                          context: context);
                    }
                  },
                  child: Text(
                    'Login',
                    style: semiBoldStyle(color: ColorManager.white , fontSize: FontSizeManager.s15),
                  ),
                ),
              )
          ),
          OrDivider(),

          SizedBox(
              width: widh,
              child: Selector<loginUser_viewModel , bool>(
                selector: (_,provider)=>provider.isLoading,
                builder: (_,isLoading,__)=> isLoading? const Center(
                  child: CircularProgressIndicator(
                    color: ColorManager.defaultColor,
                  ),
                ) :
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: AppElevation.e5,
                    padding: const EdgeInsets.all(AppPadding.p15),
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
                    primary: Colors.red,
                    // ColorManager.defaultColor
                  ),
                  onPressed: ()async{



                  },
                  child: Text(
                    'Continue with Google',
                    style: semiBoldStyle(color: ColorManager.white , fontSize: FontSizeManager.s15),
                  ),
                ),
              )
          ),


          /// register now


        ],
      ),
    );
  }
}


class OrDivider extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height*0.03),
      width : size.width * 0.8,
      child: Row(
        children: <Widget>[
          Expanded(
              child: Divider(
                color: Colors.black,
                height: 1.5,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text("OR",style:TextStyle(fontSize: 12,fontFamily: FontFamilyManager.defaultFamily,fontWeight: FontWeightManager.bold , color: Colors.black)),
          ),
          Expanded(
              child: Divider(
                color: Colors.black,
                height: 1.5,
              )),
        ],
      ),
    );
  }

}
