import 'package:double_back_to_close/double_back_to_close.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:keyofscience/presentation/main/Courses/view/CoursesScreen.dart';
import 'package:keyofscience/presentation/main/main_Viewmodel.dart';
import 'package:keyofscience/presentation/main/postsPages/view/Posts_view.dart';
import 'package:keyofscience/presentation/main/postsPages/view/postPage_view.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:animations/animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:provider/provider.dart';


import '../../../../models/Models.dart';
import '../../Pages/home_page.dart';
import '../../models/Models.dart';
import '../resources/images.dart';
import 'drawerScreen/view/MenuScreen.dart';
import 'homeScreen/view/MainScreen.dart';


/// this page is not visible ( invisible Wisget ) , this is the widget that containe both MainPage
/// ( you can consider it like HOMEPAGE , a,d the MENUPAGe ( the page of the drawer))

class HomePage extends StatefulWidget {
   const HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {

    initDynamicLinks();
    super.initState();
  }

  ///Retreive dynamic link firebase.
  void initDynamicLinks() async {
try{
  print("initDynamicLinksinitDynamicLinks");
  /// https://keyofscience.page.link/QecatCsNcjGNKPbc7
  final PendingDynamicLinkData? data =
  await FirebaseDynamicLinks.instance.getInitialLink();
  final Uri? deepLink = data?.link;

  if (deepLink != null) {
    handleDynamicLink(deepLink);
  }
  FirebaseDynamicLinks.instance.onLink(
      onSuccess: (PendingDynamicLinkData? dynamicLink) async {
        final Uri? deepLink = dynamicLink?.link;

        if (deepLink != null) {
          handleDynamicLink(deepLink);
        }
      }, onError: (OnLinkErrorException e) async {
    print(e.message);
  });
}catch (e){}
  }

  handleDynamicLink(Uri url) {
    print("url is \n $url");
    List<String> separatedString = [];
    separatedString.addAll(url.path.split('/'));
    print("separatedStringseparatedString \n $separatedString");
    if (separatedString[1] == "post") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => postPage_fromLink(separatedString[2]),
              //     MultiProvider(
              //   providers: [
              // ChangeNotifierProvider<postsPage_modelView>(create: (_)=>postsPage_modelView()),
              //   ],
              //   child: postPage_fromLink(separatedString[2]),
              // )
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
  //  final ZoomDrawerController _drawerController=ZoomDrawerController();
    // final Size mqs = MediaQuery.of(context).size;
    final double width = MediaQuery.of(context).size.width;

    return ZoomDrawer(
      controller: ZoomDrawerController(),
      style: DrawerStyle.Style1,
      menuScreen: const drawerScreen(),
      mainScreen: const homePage(),
      borderRadius: AppRadius.r24,
      angle: 0.0,
      showShadow: true,
      mainScreenTapClose: true,
      backgroundColor: Colors.grey[300]!,
      slideWidth: width * 0.65,
      openCurve: Curves.easeInQuint,
      closeCurve: Curves.easeInQuint,
    );
  }
}


class homePage extends StatelessWidget {
  const homePage();


  @override
  Widget build(BuildContext context) {
      const List<bottomNavyItem> _bottomNavyItems = [
      bottomNavyItem(title: "Home", icon_asset: AppIcons.home,page: homeScreen()),
      bottomNavyItem(title: "SCHEDULE", icon_asset: AppIcons.schedule,page: Schedule()),
      bottomNavyItem(title: "POSTS", icon_asset: AppIcons.post,page: PostsScreen()),
      bottomNavyItem(title: "COURSES", icon_asset: AppIcons.courses,page: coursesScreen()),
      bottomNavyItem(title: "BOOKS", icon_asset: AppIcons.books ,page: booksScreen()),
//  bottomNavyItem(title: "STATISTICS", icon_asset: "icon"),
    ];
      int _index=Provider.of<buttomNavy_viewModel>(context).index;
    return DoubleBack(
      message : "click again to exit",
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: IconButton(
            padding: const EdgeInsets.only(left: 20),
            onPressed: () => ZoomDrawer.of(context)!.toggle(),

            icon: Image.asset(AppIcons.settings,
              color: ColorManager.defaultColor,),
          ),
          title: Text(_bottomNavyItems[_index].title),
          //  flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.cover,),
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
          onTap: (index)=>Provider.of<buttomNavy_viewModel>(context,listen: false).goTo(index),
        ),
      ),
    );
  }
}
