import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:keyofscience/presentation/main/Courses/view/CoursesScreen.dart';
import 'package:keyofscience/presentation/main/postsScreen/view/Posts_page.dart';
import 'package:keyofscience/presentation/main/sheduleScreen/view/scheduleScreen.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyofscience/presentation/resources/App.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';

import '../../../../models/Models.dart';
import '../../models/Models.dart';
import '../resources/images.dart';
import 'drawerScreen/view/MenuScreen.dart';
import 'homeScreen/view/MainScreen.dart';


/// this page is not visible ( invisible Wisget ) , this is the widget that containe both MainPage
/// ( you can consider it like HOMEPAGE , a,d the MENUPAGe ( the page of the drawer))

class HomePage extends StatelessWidget {
   const HomePage();

  @override
  Widget build(BuildContext context) {
  //  final ZoomDrawerController _drawerController=ZoomDrawerController();
    // final Size mqs = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: ZoomDrawer(
        controller: ZoomDrawerController(),
        style: DrawerStyle.Style1,
        menuScreen: const drawerScreen(),
        mainScreen: const _homePage(),
        borderRadius: AppRadius.r24,
        angle: 0.0,
        showShadow: true,
        mainScreenTapClose: true,
        backgroundColor: Colors.grey[300]!,
        slideWidth: width * 0.65,
        openCurve: Curves.easeInQuint,
        closeCurve: Curves.easeInQuint,
      ),
    );
  }
}


class _homePage extends StatefulWidget {
  const _homePage();

  @override
  State<_homePage> createState() => _homePageState();
}

class _homePageState extends State<_homePage> {
  static const List<bottomNavyItem> _bottomNavyItems = [
    bottomNavyItem(title: "Home", icon_asset: AppIcons.home,page: homeScreen()),
    bottomNavyItem(title: "SCHEDULE", icon_asset: AppIcons.schedule,page: scheduleScreen()),
    bottomNavyItem(title: "POSTS", icon_asset: AppIcons.post,page: Posts_Body()),
    bottomNavyItem(title: "COURSES", icon_asset: AppIcons.courses,page: coursesScreen()),
//  bottomNavyItem(title: "STATISTICS", icon_asset: "icon"),
  ];
  int _index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => ZoomDrawer.of(context)!.toggle(),
          icon: Image.asset(AppIcons.settings,
            color: ColorManager.defaultColor,),
        ),
        title: const Text(app.appName),
        flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.cover,),
      ),
      body: PageTransitionSwitcher(
        duration: const Duration(seconds: 1),
        transitionBuilder: (child,primaryAnimation,secondaryAnimation)=>SharedAxisTransition(
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.horizontal,
          child: child,
        ),
        child: _bottomNavyItems[_index].page,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _bottomNavyItems.map((item) => BottomNavigationBarItem(
            icon: SvgPicture.asset(
              item.icon_asset,
              color: _index==_bottomNavyItems.indexOf(item)? ColorManager.defaultColor : ColorManager.grey,
            ),
            label: item.title,
        ),
        ).toList(),
        currentIndex: _index,
        onTap: (i)=>i==_index? null : setState(()=>_index=i),
      ),
    );
  }
}
