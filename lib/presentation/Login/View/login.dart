import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/commun/Validator.dart';
import 'package:provider/provider.dart';


import '../../resources/FontsManager.dart';
import '../../../main.dart';
import '../../resources/Styles_Manager.dart';
import '../../resources/values_manager.dart';
import '../ViewModel/login_viewModel.dart';



class Login extends StatefulWidget {
  const  Login();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<loginUser_viewModel>(create:(_)=> loginUser_viewModel())
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getThemeData().copyWith(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ElevatedButton.styleFrom(
                    elevation: AppElevation.e5,
                    padding: const EdgeInsets.all(AppPadding.p12),
                    shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppMargin.m10)),
                    primary: ColorManager.white,
                    // ColorManager.defaultColor
                  )
              ),
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    textStyle: boldStyle(
                        color: ColorManager.white,
                        fontWeight: FontWeightManager.bold,
                        fontSize: 12.0
                    ),
                  )
              )
          ),
          home: Scaffold(
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Stack(
                children: [
                  /// the background
                  Container(
                    height: height * 0.5,
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                        app.appName,
                        style: Theme.of(context).textTheme.headline5
                    ),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(images.backgroundLogin),
                          fit: BoxFit.cover),
                    ),
                  ),
                  /// the textfields and buttons
                  Positioned(
                    bottom: 0,
                    child: Container(
                        height: height * 0.52,
                        width: widh,
                        padding: const EdgeInsets.only(
                            right: AppPadding.p20, left: AppPadding.p20, top: AppPadding.p40),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: AppRadius.r8,
                              blurRadius: AppRadius.r14,
                              offset: const Offset(AppOffset.off0_0, AppOffset.off3_0),
                            ),
                          ],
                          color: ColorManager.defaultColor,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppRadius.r30),
                            topRight: Radius.circular(AppRadius.r30),
                          ),
                        ),
                        child: const TextFormFields()
                    ),
                  ),
                ],
              ),
            ),
          )
      )
    );
  }
}




class TextFormFields extends StatefulWidget {
  const TextFormFields({Key? key}) : super(key: key);

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
      child: SingleChildScrollView(
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
                  hintText: " E-mail",
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value)=>validator.emailValidator(value?? ""),
              ),
            ),

            /// Password
            StatefulBuilder(
              builder: (_,setstate){
                return  Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p30),
                  child: TextFormField(
                    style: const TextStyle(color: ColorManager.black),
                    controller: passwordTextEdetingController,
                    cursorColor: ColorManager.defaultColor,
                    decoration:  InputDecoration(
                      hintText: ' Password',
                      prefixIcon: const Icon(Icons.password),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setstate(()=>inVisible=!inVisible);
                          },
                          icon: Icon(inVisible
                              ? Icons.visibility_off
                              : Icons.visibility)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "don't remmember password ?",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                TextButton(
                  onPressed: (){},
                  child: const Text(' rest here ',
                    style: TextStyle(color: ColorManager.white,),
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
                      color: ColorManager.white,
                    ),
                  ) :
                  ElevatedButton(
                    onPressed: ()async{
                      if( _formKey.currentState!.validate()){
                        await Provider.of<loginUser_viewModel>(context,listen: false).loginUser(
                            email: emailTextEdetingController.text.trim(),
                            password: passwordTextEdetingController.text.trim(),
                            context: context);
                      }
                    },
                    child: Text(
                      'LOG IN',
                      style: semiBoldStyle(color: ColorManager.defaultColor),
                    ),
                  ),
                )
            ),

            const SizedBox(
              height: 20,
            ),

            /// register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const   Text(
                  "don't have account ?",
                  style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontFamily: "Montserrat"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_)=>const MyApp()),
                    );
                  },
                  child: const Text(' register now ',
                    style: TextStyle(color: ColorManager.white),),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
