import 'package:auto_size_text/auto_size_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:keyofscience/commun/Validator.dart';
import 'package:keyofscience/presentation/main/main_Viewmodel.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/Login/View/login.dart';
import 'package:keyofscience/presentation/Register/viewModel/RegisterViewModel.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:provider/provider.dart';

import '../../resources/ColorManager.dart';
import '../../resources/values_manager.dart';




class RegisterPage extends StatelessWidget {
  final PageController pageController;
  const  RegisterPage(this.pageController);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return WillPopScope(
        child: MultiProvider(
          providers: [
            ChangeNotifierProvider<RegisterUser_viewModel>(create: (_) => RegisterUser_viewModel()),
          ],
          child: Scaffold(
            appBar: AppBar(
              elevation: 3,
              centerTitle: false,
              backgroundColor: Colors.white,
              title: const Text(app.appName , style: TextStyle(color: ColorManager.defaultColor),),
            ),
            body: CustomScrollView(
              slivers: <Widget>[
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Padding(
                          padding: EdgeInsets.only(
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
                                          text: AppStrings.registertitle1 ,
                                          style: Theme.of(context).textTheme.headline1
                                      ),
                                      TextSpan(
                                          text: AppStrings.registertitle2 ,
                                          style: Theme.of(context).textTheme.headline1

                                      )
                                    ]
                                ),
                              ),
                              const  SizedBox(height: AppHeight.h10,),
                              Text(
                                AppStrings.registerSubtitle,
                                style: Theme.of(context).textTheme.caption,
                                // style: TextStyle(
                                //     color: Colors.grey ,
                                //     fontFamily: "Montserrat"
                                // ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      /// textFormFields + register Button
                      const TextFormFields(),
                    ],
                  ),
                ),
                SliverFillRemaining(
                    hasScrollBody: false,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: double.infinity,
                          height: height * 0.08,
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
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: AppMargin.m20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.haveAccount,
                                style: Theme.of(context).textTheme.headline2,
                                // style: TextStyle(color: Kdefault.KdefaultColor , fontFamily: "Montserrat"),
                              ),
                              TextButton(
                                onPressed: (){
                                  pageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
                                },
                                // onPressed: ()=>Navigator.pop(context),
                                // onPressed: ()=> Navigator.push(context,
                                //   MaterialPageRoute(
                                //     builder: (context) => const Login(),
                                //   ),
                                // ),
                                child: const Text(AppStrings.login),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                )
              ],
            ),
          ),
        ),
        onWillPop: ()async{
          pageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
          return false;
        }
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
    return Padding(
      padding: const  EdgeInsets.only(right: AppPadding.p20  , left: AppPadding.p20 , top: AppPadding.p30 , ) ,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// name
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p30),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: nameTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                 decoration: const InputDecoration(
                     border: InputBorder.none,
                     focusedBorder: InputBorder.none,
                     enabledBorder: InputBorder.none,
                     errorBorder: InputBorder.none,
                     disabledBorder: InputBorder.none,
                     fillColor: ColorManager.textFieldColor,
                     hintText: " Full name",
                   contentPadding: EdgeInsets.symmetric(vertical:14 ,horizontal: 14),
                   prefixIcon: Icon(Iconsax.user, color: Colors.grey, ),
                   hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                ),
                validator: (value)=>validator.nameValidator(value?? ""),
              ),
            ),
            /// Email
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p30),
              child: TextFormField(
                style: const TextStyle(color: Colors.black),
                controller: emailTextEdetingController,
                cursorColor: ColorManager.defaultColor,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  fillColor: ColorManager.textFieldColor,
                  hintText: ' E-mail',
                  contentPadding: EdgeInsets.symmetric(vertical:14 ,horizontal: 14),
                  prefixIcon: Icon(Icons.email_outlined, color: Colors.grey, ),
                  hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
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
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: ColorManager.textFieldColor,
                            contentPadding: EdgeInsets.symmetric(vertical:14 ,horizontal: 14),
                            prefixIcon: Icon(Iconsax.key, color: Colors.grey, ),
                            hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                            hintText: ' Password',
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child: Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility , color: Colors.grey)),
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
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            fillColor: ColorManager.textFieldColor,
                            contentPadding: EdgeInsets.symmetric(vertical:14 ,horizontal: 14),
                            prefixIcon: Icon(Iconsax.key, color: Colors.grey, ),
                            hintStyle: TextStyle(color: Colors.grey , fontSize: 12 , fontWeight: FontWeight.w600),
                            hintText: ' Confirm Password',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                  setstate(()=>inVisible=!inVisible);
                                },
                                child : Icon(inVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility , color: Colors.grey,),
                              ),

                          ),
                          validator: (value)=>validator.confirm_pass_Validator(value?? "" , passwordTextEdetingController.text.trim()),
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: inVisible,
                        ),
                      ),
                    ]
                );
              },
            ),
            /// privacy text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppStrings.privacy1,
                        style: TextStyle(color: Colors.black , fontSize: 12,fontFamily: "Montserrat"),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: (){
                        },
                        child: Text(
                          AppStrings.privacy2,
                          style: TextStyle(color: ColorManager.defaultColor , fontSize: 12,fontFamily: "Montserrat" , fontWeight: FontWeight.bold),
                        )
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                  },
                  child:Text(
                    AppStrings.privacy3,
                    style: TextStyle(color: ColorManager.defaultColor , fontSize: 12,fontFamily: "Montserrat" , fontWeight: FontWeight.bold),
                ),),
              ],
            ),
            const  SizedBox(height: 50,),
            SizedBox(
              width: width,
              child: Selector<RegisterUser_viewModel, bool>(
                selector: (context, provider) => provider.isLoading,
                builder: (_,isLoading,child) {
                 return isLoading ? const Center(
                    child: CircularProgressIndicator(),
                  ) :
                  ElevatedButton(
                    onPressed: () async {
                      if(_formKey.currentState!.validate()){
                        FocusScope.of(context).unfocus();
                        Provider.of<nextPage_viewModel>(context,listen: false).register();
                        Provider.of<RegisterUser_viewModel>(context,listen: false).registerUser(
                            email: emailTextEdetingController.text.trim(),
                            password: passwordTextEdetingController.text.trim(),
                            username: nameTextEdetingController.text.trim(),
                            context : context);

                      }
                    },
                    child: const Text(
                      AppStrings.signUp,
                    ),
                  );
                }
              )
            ),
            // LoginButton(text: 'SIGN UP', onpressed: (){
            //   Navigator.push(context,
            //     MaterialPageRoute(builder: (context) =>  const  PreferredCourses()),
            //   );
            // },),
          ],
        ),
      ),
    );
  }
}


