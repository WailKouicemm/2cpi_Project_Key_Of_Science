import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/OnBoarding/View/RECOMMENDED%20_COURSES.dart';
import 'package:keyofscience/presentation/OnBoarding/View/preferredcourses.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../resources/ThemeManager.dart';
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
    super.dispose();
  }
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return  Selector<pageIndexProvider, int>(
      selector: (context, provider) => provider.index,
      builder: (BuildContext context, value, Widget? child)=> MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: getThemeData(),
          home: Scaffold(
              appBar: AppBar(
                  flexibleSpace: Container(
                    decoration:  const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images.appBarImage),
                            fit: BoxFit.cover)),
                  ),
                  title: const Text(app.appName),
                  actions: [
                    for(int i=0;i<2;i++) Padding(
                      padding: const EdgeInsets.all(AppPadding.p2),
                      child: Icon( value==i? Icons.circle :  Icons.circle_outlined,size: 10,),
                    ),
                    const SizedBox(
                      width: AppWidth.w5,
                    ),
                  ]
              ),
              body: PageView.builder(
                controller: _pageController,
                onPageChanged: (index)=>Provider.of<pageIndexProvider>(context,listen: false).onPageChanges(index),
                itemBuilder: (_,index)=> index ==0?  const PreferredCourses() :
                const RECOMMANDED_COURSES(),
              ),
              floatingActionButton: value==0? FloatingActionButton(
                onPressed: ()=>_pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: AppDuration.pageViewDelay),
                  curve: Curves.easeIn,
                ),
                child: const Icon(Icons.navigate_next_rounded),
              ) : null
          )
      ),
    );
  }
}
