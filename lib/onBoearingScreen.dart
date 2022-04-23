import 'package:flutter/material.dart';
import 'package:keyofscience/pages/RECOMMENDED%20_COURSES.dart';
import 'package:keyofscience/pages/preferredcourses.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';


class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen();

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

  int  _currentIndex=0;
  final _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          flexibleSpace: Container(
            decoration:  const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/backround_appbar.png"),
                    fit: BoxFit.cover)),
          ),
          title: const Text("KEYEINCE"),
          actions: [
            for(int i=0;i<2;i++)  Padding(
              padding: const EdgeInsets.all(AppPadding.p2),
              child: Icon(_currentIndex==i? Icons.circle : Icons.circle_outlined,
                color: ColorManager.defaultColor,size: 10,),
            ),
            const SizedBox(
              width: AppWidth.w5,
            ),
          ]
      ),
      body: PageView.builder(
        controller: _pageController,
          itemCount: 2,
          onPageChanged: (index)=>setState(()=>_currentIndex=index),
          itemBuilder: (_,index) {
            return index==0? const PreferredCourses() : const RECOMMANDED_COURSES();
          }
      ),
      floatingActionButton:_currentIndex==0?  FloatingActionButton(
        onPressed: ()=>_pageController.animateToPage(
          1,
          duration: const Duration(milliseconds: AppDuration.pageViewDelay),
          curve: Curves.easeIn,
        ),
        child: const Icon(Icons.navigate_next_rounded),
      ) : null,
    );
  }
}
