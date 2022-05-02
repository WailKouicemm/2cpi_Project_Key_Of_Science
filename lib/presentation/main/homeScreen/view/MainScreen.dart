import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/Widgets/Post.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/Styles_Manager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../Widgets/Add_post_Dialog.dart';
import '../../../../models/Models.dart';
import '../../../../Widgets/Course_card.dart';
import '../../../../services/Authenctication.dart';
import '../../postsScreen/view/Posts_page.dart';


class homeScreen extends StatelessWidget {
  const homeScreen();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
          children: [
            profilecard(height: height , name: AuthService.username,),
            const Title_Text(txt:'   Keyeince features',seAll: false),
            const Keyeince_features(),
            const Title_Text(txt:'   Courses for you',seAll: true),
            const CorsesListViewItems(),
            const recentlyPoststitle(),
            const Recentrly_posts(),
            const SizedBox(
              height: AppMargin.m10,
            )
          ]
      ),
    );
  }
}

class recentlyPoststitle extends StatelessWidget {
  const recentlyPoststitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: AppPadding.p10,left: AppPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
               Text('   Recently posts',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeightManager.bold),
               ),
             TextButton(
              onPressed: ()=> Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (_)=>const PostsPage()
                  ),
              ),
              child: const Text('SEE ALL'),
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
        padding: const EdgeInsets.all(AppPadding.p10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(txt, style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeightManager.bold)),
            if(seAll)
               const TextButton(
                onPressed: null,
                child: Text('SEE ALL'),
              ),
          ],
        )
    );
  }
}

class profilecard extends StatelessWidget {
  final double height;
  final String name;
  const profilecard({required this.height,required this.name,});


  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.all(AppPadding.p25),
        margin: const EdgeInsets.only(top:AppMargin.m10),
        height: height * 0.2,
        width: double.infinity,
        decoration: const BoxDecoration(
          image:  DecorationImage(
              image: AssetImage(images.card),
              fit: BoxFit.fill
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children:   [
                  Text('Hi , ' + name ,
                      style: boldStyle(color: ColorManager.white)
                  ),
                  const SizedBox(height: AppHeight.h14,),
                  AutoSizeText(
                    'Your reacently coursz : JAVA BASICS \n\nNext lesson : Monday,18 at 13:00',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                ],
              ),
            ),
            /// the percentage circularAvatar
            Container(
                decoration: const BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: ColorManager.white,
                        blurRadius: AppRadius.r70,
                        offset: Offset(AppOffset.off0_0,AppOffset.off0_75)
                    )
                  ],
                ),
                child:  CircleAvatar(
                  backgroundColor: ColorManager.white,
                  maxRadius: AppRadius.r30,
                  child: Center(
                    child: Text('50%',
                      style: boldStyle(color: ColorManager.black,fontSize: FontSizeManager.s17)
                    ),
                  ),
                )
            ),
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
              color: ColorManager.defaultColor,
              borderRadius: BorderRadius.circular(7),
              boxShadow: const <BoxShadow>[
                BoxShadow(
                    color: ColorManager.black26,
                    blurRadius: AppRadius.r10,
                    offset: Offset(AppOffset.off0_0, AppOffset.off0_75),
                )
              ],
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
                  style: Theme.of(context).textTheme.subtitle1
                ),
                Icon(tmp.logo,
                  color: ColorManager.white,),
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




class CorsesListViewItems extends StatelessWidget {
  const CorsesListViewItems();

  @override
  Widget build(BuildContext context) {
    const  List<course> _populaCorses =  [
      course(
          image: 'assets/images/photoshop.jpg',
          title: 'complet photoshop course',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/illustrator.jpeg',
          title: 'Illustrator CC Full Course',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/ae.jpg',
          title: 'intoduction to ui utilization of after Effects',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/java.jpg',
          title: 'introduction to Java',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course2.png',
          title: 'UI/UX COURSES',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course.jpg',
          title: 'COURSES OFFRED',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course2.png',
          title: 'UI/UX COURSES',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course2.png',
          title: 'UI/UX COURSES',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course.jpg',
          title: 'UI/UX Courses',
          coursesnum: '29 lesson'),
      course(
          image: 'assets/images/course2.png',
          title: 'UI/UX COURSES',
          coursesnum: '29 lesson'),
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
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          itemBuilder:  (context , index){
           final course tmp = _populaCorses[index];
            return Padding(
              padding: const EdgeInsets.only(right: AppPadding.p10),
              child: cours_card(cours: tmp,),
            );
          }
      ),
    );
  }
}



class Recentrly_posts extends StatelessWidget {
  const  Recentrly_posts();

  @override
  Widget build(BuildContext context) {
    const List<post> Recentrly_post=[
      post(poster_image: "assets/images/man.jpg",
          poster_name: 'Salah Eddine Salhi',
          poster_username: "sa16",
          text_of_post: "Hello , i have a www.facebook.com pub.dev about wh"
              "y we use statebook.com pub.dev about why we use statebook"
              ".com pub.dev about why we use statebook.com pub.dev about"
              " why we use stateless and statefull widgets in flutter \n"
              "Hello , i have a question about why we use stateless and statefull widgets in flutter"
              "Hello , i have a question about why we use stateless and statefull widgets in flutter"
      ),
      post(poster_image: "assets/images/man.jpg",
          poster_name: 'Walid kacemi',
          poster_username: "wa8",
          text_of_post: "Hello , i have a question about why we use getters and setters in Java"
      ),
    ];
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return SizedBox(
       height: height * 0.25,
      width: widh,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        controller: ScrollController(),
        itemCount: Recentrly_post.length,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        itemBuilder:  (context , index){
         final post tmp = Recentrly_post[index];
         // return   SizedBox(
         //   height: height * 0.25,
         //   width: widh,
         //   child: PostItem(Post: tmp,),
         // );

          return Container(
            width: widh * 0.8,
            margin: const EdgeInsets.fromLTRB(AppMargin.m10,AppMargin.m10,AppMargin.m10,AppMargin.m20),
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p15,vertical: AppPadding.p20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppRadius.r15),
              color: ColorManager.white,
              boxShadow:  <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: AppRadius.r5,
                  blurRadius: AppRadius.r7,
                  offset: const Offset(AppOffset.off0_0, AppOffset.off3_0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PosterNameAndImage(tmp.poster_name, tmp.poster_username),
                // Row(
                //   children: [
                //     /// the user image
                //     const UserImage(img: 'assets/images/man.jpg'),
                //     const SizedBox(
                //       width: AppWidth.w10,
                //     ),
                //     /// the name ad the username
                //     Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text("#"+tmp.poster_username,
                //           style: Theme.of(context).textTheme.caption,
                //         ),
                //         Text(tmp.poster_name,
                //           style: Theme.of(context).textTheme.headline4!.copyWith(
                //             fontSize: FontSizeManager.s15
                //           )
                //         ),
                //       ],
                //     ),
                //   ],
                // ),
                const SizedBox(
                  height: AppHeight.h10,
                ),
                /// the post's content
                Expanded(
                  child: postContent(tmp.text_of_post,maxlines: 3,),
                )
                // Expanded(
                //   child: Linkify(
                //     onOpen: (link) async {
                //       if (await canLaunch(link.url)) {
                //         await launch(link.url);
                //       } else {
                //         throw 'Could not launch $link';
                //       }
                //     },
                //     text: tmp.text_of_post,
                //     linkStyle: const TextStyle(color: ColorManager.LinkColor ),
                //     style: Theme.of(context).textTheme.bodyText1,
                //     overflow: TextOverflow.fade,
                //   ),
                // ),
                // AutoSizeText(
                //   tmp.text_of_post,
                //   maxLines: 3,
                //   maxFontSize: FontSizeManager.s24,
                //   minFontSize: FontSizeManager.s15,
                //   overflow: TextOverflow.ellipsis,
                //   style: Theme.of(context).textTheme.bodyText1
                // ),
              ],
            ),
          );
        }
      ),
    );
  }
}


