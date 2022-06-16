import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/OnBoarding/View/RECOMMENDED%20_COURSES.dart';
import 'package:keyofscience/presentation/OnBoarding/View/preferredcourses.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/AwesomeMessag.dart';
import '../../../kdefault.dart';
import '../../main/main_Viewmodel.dart';
import '../../resources/ThemeManager.dart';
import '../../resources/appStrings.dart';
import '../ViewModel/OnBoarding_ViewModel.dart';


class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen();

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

   late final PageController _pageController;
  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }
  @override
  void dispose() {
    _pageController.dispose();
    Provider.of<nextPage_viewModel>(context,listen: false).setFalse();
    super.dispose();
  }
  final List _onBoardingPages =  const [
     PreferredCourses(),
     RECOMMANDED_COURSES(),
  ];
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<pageIndexProvider>(create: (_) => pageIndexProvider()),
        ChangeNotifierProvider<selectedItemProvier>(create: (_) => selectedItemProvier()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getThemeData(),
          home: Selector<pageIndexProvider, int>(
              selector: (context, provider) => provider.index,
              builder: (BuildContext context, value, Widget? child)=> Scaffold(
                  backgroundColor: ColorManager.primaryColor,
                  appBar: AppBar(
                    centerTitle: false,
                    elevation: 0,
                    title: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: const Text(app.appName , style: TextStyle(color: ColorManager.defaultColor),),
                    ),
                    actions: [
                      for(int i=0;i<2;i++) Padding(
                        padding: const EdgeInsets.all(AppPadding.p2),
                        child: Icon( value==i? Icons.circle :  Icons.circle_outlined,size: 10,),
                      ),
                      const SizedBox(
                        width: AppWidth.w5,
                      ),
                    ],
                  ),
                  body: PageView.builder(
                      pageSnapping: false,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _pageController,
                      itemCount: _onBoardingPages.length,
                      onPageChanged: (index)=>Provider.of<pageIndexProvider>(context,listen: false).onPageChanges(index),
                      itemBuilder: (_,index)=> _onBoardingPages[index]
                  ),
                  floatingActionButton: value==0? FloatingActionButton(
                    onPressed: (){
                      if(Provider.of<selectedItemProvier>(context,listen: false).selectedItems.length<3){
                        AwesomeMessag(context: context, title: AppStrings.errorTitle,
                        message: "Please enter at least 3 category");
                      }else{
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: AppDuration.pageViewDelay),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: const Icon(Icons.navigate_next_rounded),
                  ) : null
              )
          )

      ),
    );

  }
}

