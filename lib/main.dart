import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:keyofscience/presentation/Login/View/login.dart';
import 'package:keyofscience/presentation/OnBoarding/View/onBoearingScreen.dart';
import 'package:keyofscience/presentation/Register/view/RegisterPage.dart';
import 'package:keyofscience/presentation/WelcomScreen/WelcomScreen.dart';
import 'package:keyofscience/presentation/main/main_Viewmodel.dart';
import 'package:keyofscience/presentation/main/main_view.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  /// this is used to remove the color of the status bar of the phone
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   theme: getThemeData(),
    //   debugShowCheckedModeBanner: false,
    //   home: const HomePage(),
    // );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<nextPage_viewModel>(create: (_)=>nextPage_viewModel()),
        ChangeNotifierProvider<buttomNavy_viewModel>(create: (_)=>buttomNavy_viewModel())
      ],
      child: MaterialApp(
        theme: getThemeData(),
        debugShowCheckedModeBanner: false,
        home: Builder(
          builder: (context)=>StreamBuilder(
            stream: auth.FirebaseAuth.instance.authStateChanges(),
            builder: (_,snapshot){
              if(snapshot.hasData){
               //  Provider.of<usernameManage>(context,listen: false).fetchUsername();
                return const NextPage();
              }
              return const WelcomScreen();
            },
          ),
        )
      ),
    );
  }
}

class loginORregister extends StatefulWidget {
  const loginORregister({Key? key}) : super(key: key);

  @override
  State<loginORregister> createState() => _loginORregisterState();
}

class _loginORregisterState extends State<loginORregister> {
  late PageController _pageViewController;

  @override
  void initState() {
    _pageViewController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageViewController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    final  _pages =   [Login(_pageViewController), RegisterPage(_pageViewController)];
    return PageView.builder(
      itemCount: _pages.length,
      allowImplicitScrolling: false,
      controller: _pageViewController,
      itemBuilder: (_,index)=>_pages[index],
    );
  }
}



class NextPage extends StatelessWidget {
  const NextPage();

  @override
  Widget build(BuildContext context) {
   final bool goToOnBoarding =  Provider.of<nextPage_viewModel>(context,listen: false).goToOnBoarding;
    return  goToOnBoarding ? const onBoardingScreen() : const  HomePage();
  }
}
