import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:keyofscience/pages/Bottom_navy_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Widgets/Add_post_Dialog.dart';
import '../kdefault.dart';
import '../models/Course_model.dart';
import '../models/postModel.dart';
import 'Course_card.dart';
import 'Posts_page.dart';



class MainScreen extends StatelessWidget {
  const MainScreen();

  @override
  Widget build(BuildContext context) {
    // print('MainScreen called');
  //  const Color KdefaultCOlor= Color(0xFF2958F5);
    int index=0;
    return  Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => ZoomDrawer.of(context)!.toggle(),
            icon: Image.asset('assets/images/options-2-outline.png',color:const Color(0xFF2958F5),),
          ),
          title: const Text('KEYEINCE',
            style: TextStyle(
                color: Color(0xFF2958F5)
            ),
          ),
          centerTitle: true,
          flexibleSpace: Image.asset('assets/images/backround_appbar.png',fit: BoxFit.cover,),
        ),
        body: const theBody(),
      bottomNavigationBar: StatefulBuilder(
        builder: (context,setstate)=>BottomNavigationBar(
          /*
        bottomNavyItems
         */
          items: bottomNavyItems.map((item) => BottomNavigationBarItem(
              icon: SvgPicture.asset(
                item.icon_asset,
                color: index==bottomNavyItems.indexOf(item)? KdefaultColor : Colors.grey,
              ),
              label: item.title
          ),
          ).toList(),
          currentIndex: index,
          selectedItemColor: KdefaultColor,
          unselectedItemColor: Colors.grey,
          onTap: (i)=>setstate(()=>index=i),
        ),
      )
    );
  }
}

class theBody extends StatelessWidget {
  const theBody();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
          children: [
            profilecard(height: height),
            const Title_Text(txt:'   Keyeince features',seAll: false),
            const Keyeince_features(),
            const Title_Text(txt:'   Courses for you',seAll: true),
            const CorsesListView(),
            const recentlyPoststitle(),
            const Recentrly_posts()
          ]
      ),
    );
  }
}

class recentlyPoststitle extends StatelessWidget {
  const recentlyPoststitle();

  @override
  Widget build(BuildContext context) {
    const Color KdefaultCOlor= Color(0xFF2958F5);
    return Padding(
        padding: const EdgeInsets.only(top: 10,left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            const  Text('   Recently posts',
              style:  TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 fontFamily: "Montserrat",
              ),),
             TextButton(
              onPressed: ()=> Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_)=>const PostsPage()
                  ),
              ),
              child: const Text('SEE ALL',
                style: TextStyle(
                  fontSize: 12,
                  color: KdefaultCOlor,
                ),
              ),
            ),
          ],
        )
    );
  }
}


class Title_Text extends StatelessWidget {
final String txt;
final bool seAll;
  const Title_Text({required  this.txt,required  this.seAll});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 fontFamily: "Montserrat",
              ),),

            if(seAll)
              const  TextButton(
                onPressed: null,
                child:  Text('SEE ALL',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF2958F5),
                  ),
                ),
              ),
          ],
        )
    );
  }
}

class profilecard extends StatelessWidget {
  final double height;
  const profilecard({required this.height,});


  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.only(left: 25 , top: 25 , bottom: 25,right: 25),
        margin: const EdgeInsets.only(top:10),
        height: height * 0.2,
        width: double.infinity,
        decoration: const BoxDecoration(
          image:  DecorationImage(
              image: AssetImage('assets/images/CARD.png'),
              fit: BoxFit.fill
          ),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:  const [
                Text('Hi , Mohamed' , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text('Your reacently coursz : JAVA BASICS' , style: TextStyle(color: Colors.white , ),),
                SizedBox(height: 15,),
                Text('Next lesson : Monday,18 at 13:00' , style: TextStyle(color: Colors.white , ),)

              ],
            ),
            const Spacer(),
            Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 70.0,
                        offset: Offset(0.0, 0.75)
                    )
                  ],
                ),
                child: const CircleAvatar(
                  backgroundColor: Colors.white,
                  maxRadius: 30,
                  child: Center(
                    child: Text('50%',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                )
            )
          ],
        )
    );
  }
}

class Keyeince_features_item{
  final String name;
  final IconData logo;
  final Function() onpressed;
  const Keyeince_features_item({required this.onpressed,required this.name,required this.logo});
}

class Keyeince_features extends StatelessWidget {
  const Keyeince_features();

  @override
  Widget build(BuildContext context) {
     List<Keyeince_features_item> Keyeince_features_items = [
      Keyeince_features_item(name: "Add\nnote", logo: Icons.note_add_outlined, onpressed: (){}),
      Keyeince_features_item(name: "Study\nresult", logo: Icons.query_stats,onpressed: (){}),
      Keyeince_features_item(name: 'Add\npost', logo: Icons.add,onpressed: (){
        showDialog(
            context: context,
            builder: (_)=>const Allertdialog(),
        );
      } ),
    ];
    return Row(
      children:  Keyeince_features_items.map((tmp) => Expanded(
        child: InkWell(
          onTap: tmp.onpressed,
          child: Container(
            height: 60,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF2958F5),
              borderRadius: BorderRadius.circular(7),
              // image: const DecorationImage(
              //   image: AssetImage('assets/images/CARD.png'),
              //   fit: BoxFit.fill,
              // ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  tmp.name,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Icon(tmp.logo,
                  color: Colors.white,),
              ],
            ),
          ),
        ),
      ),
      ).toList(),
    );
  }
}








/*
List<courses> _webdevloppment =const [
  courses(path: 'images/backround_appbar.png' , title: 'Full stack', coursesnum: '29'),
  courses(path: 'images/backround_appbar.png' , title: 'Frontend Course',coursesnum: '29'),
  courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),
  courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),
  courses(path: 'images/backround_appbar.png' , title: 'UI/UX Courses',coursesnum: '29'),
  courses(path: 'images/backround_appbar.png' , title: 'UI/UX COURSES',coursesnum: '29'),

];

 */




class CorsesListView extends StatelessWidget {
  const CorsesListView();

  @override
  Widget build(BuildContext context) {
    const  List<course> _populaCorses =  [
      course(path: 'assets/images/backround_appbar.png' , title: 'introduction to Java' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'COURSES OFFRED' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'UI/UX Courses' , coursesnum: '29'),
      course(path: 'assets/images/backround_appbar.png' , title: 'UI/UX COURSES' , coursesnum: '29'),
    ];
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:  height * 0.2,
      width:  width,
      child: ListView.builder(
          addAutomaticKeepAlives: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(),
          itemCount: _populaCorses.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder :  (context , index){
            course tmp = _populaCorses[index];
            return Cours_card(cours: tmp,);
          }
      ),
    );
  }
}

const List<post> Recentrly_post=[
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Salah Eddine Salhi',
      poster_username: "sa16",
      text_of_post: "Hello , i have a question about why we use stateless and statefull widgets in flutter \n"
          "Hello , i have a question about why we use stateless and statefull widgets in flutter"
          "Hello , i have a question about why we use stateless and statefull widgets in flutter"
  ),
  post(poster_image: "assets/images/man.jpg",
      poster_name: 'Walid kacemi',
      poster_username: "wa8",
      text_of_post: "Hello , i have a question about why we use getters and setters in Java"
  ),
];

class Recentrly_posts extends StatelessWidget {
  const  Recentrly_posts();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return SizedBox(
      height: height * 0.25,
      width: widh,
      child: ListView.builder(
        shrinkWrap: true,
          addAutomaticKeepAlives: true,
          physics: const BouncingScrollPhysics(),
        controller: ScrollController(),
        itemCount: Recentrly_post.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder :  (context , index){
          post tmp = Recentrly_post[index];
          return Container(
            width: widh * 0.8,
            margin: const EdgeInsets.fromLTRB(10,10,10,20),
            padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              boxShadow:  <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    /// the user image
                    const CircleAvatar(
                      maxRadius: 27,
                      backgroundColor: Colors.lightBlueAccent,
                      child: CircleAvatar(
                        maxRadius: 25,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/images/man.jpg'),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    /// the name ad the username
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(tmp.poster_name,
                          style:const TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text("#"+tmp.poster_username,
                          style: const TextStyle(
                              color: Colors.grey
                          ),),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  tmp.text_of_post,
                  maxLines: 3,
                  maxFontSize: 25,
                  minFontSize: 15,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                     // fontSize: 15
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}
