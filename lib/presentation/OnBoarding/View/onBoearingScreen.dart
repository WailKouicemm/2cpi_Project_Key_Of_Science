import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/OnBoarding/View/RECOMMENDED%20_COURSES.dart';
import 'package:keyofscience/presentation/OnBoarding/View/preferredcourses.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../../resources/ThemeManager.dart';
import '../ViewModel/OnBoarding_ViewModel.dart';


class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen();

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {

   final _pageController = PageController();
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
  return  StreamBuilder<int>(
        stream: _viewModel.outputIndex.asBroadcastStream(),
        builder: (context,snapshot){
          return snapshot.hasData? MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: getThemeData(),
              home:  Scaffold(
                appBar: AppBar(
                    flexibleSpace: Container(
                      decoration:  const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/backround_appbar.png"),
                              fit: BoxFit.cover)),
                    ),
                    title: const Text("KEYEINCE"),
                    actions:[
                      for(int i=0;i<2;i++) Padding(
                        padding: const EdgeInsets.all(AppPadding.p2),
                        child: Icon( snapshot.data==i? Icons.circle :  Icons.circle_outlined,
                          color: ColorManager.defaultColor,size: 10,),
                      ),
                      const SizedBox(
                        width: AppWidth.w5,
                      ),
                    ]
                ),
                body: PageView.builder(
                    controller: _pageController,
                    onPageChanged: (index)=>_viewModel.onPageChanged(index),
                    itemBuilder: (_,index)=> index ==0?  const PreferredCourses() :
                     const RECOMMANDED_COURSES(),
                ),
                floatingActionButton: snapshot.data==0?  FloatingActionButton(
                  onPressed: ()=>_pageController.animateToPage(
                    1,
                    duration: const Duration(milliseconds: AppDuration.pageViewDelay),
                    curve: Curves.easeIn,
                  ),
                  child: const Icon(Icons.navigate_next_rounded),
                ) : null,
              )
          ) : Center();
        }
    ) ;
  }
}
