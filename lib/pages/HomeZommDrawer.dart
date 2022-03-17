import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'MainScreen.dart';
import 'MenuScreen.dart';



class HommePage extends StatelessWidget {
   const HommePage();


  @override
  Widget build(BuildContext context) {

  //  final ZoomDrawerController _drawerController=ZoomDrawerController();
    // final Size mqs = MediaQuery.of(context).size;
    print('HommePage called');
    return ZoomDrawer(
      controller: ZoomDrawerController(),
      style: DrawerStyle.Style1,
      menuScreen: const MenuScreen(),
      mainScreen: const MainScreen(),
      borderRadius: 24.0,
      angle: 0.0,
      showShadow: true,
      mainScreenTapClose: true,
      backgroundColor: Colors.grey[300]!,
      slideWidth: MediaQuery.of(context).size.width * 0.65,
      openCurve: Curves.easeInQuint,
      closeCurve: Curves.easeInQuint,
    );
  }
}
