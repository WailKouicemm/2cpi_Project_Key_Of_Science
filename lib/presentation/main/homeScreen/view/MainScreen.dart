import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/main/Courses/view/CoursesScreen.dart';
import 'package:keyofscience/presentation/main/main_Viewmodel.dart';
import 'package:keyofscience/presentation/main/postsPages/view/addPost_view.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/Styles_Manager.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../../Pages/home_page.dart';
import '../../../../models/Models.dart';
import '../../../../Widgets/Course_card.dart';
import '../../notesScreen/notes_page.dart';



class homeScreen extends StatelessWidget {
  const homeScreen();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return  Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
            children: [
              profilecard(height: height,),
              const Title_Text(txt:'TreeTech features',seAll: false),
              const Keyeince_features(),
              const Title_Text(txt:'Courses',seAll: true),
              // const CorsesListViewItems(),
              const courses_listview("all"),
             // const recentlyPoststitle(),
              const Title_Text(txt:'Books',seAll: true),
              const courses_listview("all",isBook: true,popular: true,),
              const SizedBox(
                height: AppMargin.m20,
              )
            ]
        ),
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
               Text('Recently posts',
              style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeightManager.bold),
               ),
             TextButton(
              onPressed: ()=> Provider.of<buttomNavy_viewModel>(context,listen: false).goTo(2),
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
        padding: const EdgeInsets.symmetric(vertical: AppPadding.p15 , horizontal: AppPadding.p20),
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
  const profilecard({required this.height,});


  @override
  Widget build(BuildContext context) {

    return Container(
        padding: const EdgeInsets.all(AppPadding.p40),
        margin: const EdgeInsets.only(top:AppMargin.m10 ,left: AppMargin.m10 , right: AppMargin.m10 , ),
        height: height * 0.24,
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


                  FutureBuilder<String>(
                    future: usernameManage.getUsername(),
                    builder: (_,snapshot)=> Text('Hi , ' + (snapshot.data ?? 'HIHIHI'),
                        style: boldStyle(color: ColorManager.white,fontSize: FontSizeManager.s20,fontWeight: FontWeightManager.w800)
                    ),
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
          ],
        )
    );
  }
}



class Keyeince_features extends StatelessWidget {
  const Keyeince_features();

  @override
  Widget build(BuildContext context) {
     List<Keyeince_features_item>  Keyeince_features_items =const [
      Keyeince_features_item(name: "Add\nnote", logo: Icons.note_add_outlined, page: NotesPage()),
         Keyeince_features_item(name: "Add\ntask", logo: Icons.query_stats,page:  Schedule()),
          Keyeince_features_item(name: 'Add\npost', logo: Icons.add,page: AddPostPage()),
    ];
    return Row(
      children:  Keyeince_features_items.map((tmp) => Expanded(
        child: InkWell(
          onTap: (){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (_)=>tmp.page)
            );
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 50,
            margin: const EdgeInsets.symmetric(horizontal: 20),
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
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(tmp.logo,
                  color: ColorManager.white,),
                Text(
                    tmp.name,
                  //  style: Theme.of(context).textTheme.subtitle1
                  style: const TextStyle(
                    fontSize: 12 ,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      ).toList(),
    );
  }
}

class CorsesListViewItems extends StatelessWidget {
  final isBook;
  const CorsesListViewItems({this.isBook = false});

  @override
  Widget build(BuildContext context) {
    const  List<course> _populaCorses =  [];
    List<Book> listOfBooks = const [];
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return SizedBox(
      height:  height * 0.22,
      width:  width,
      child: ListView.builder(
          addAutomaticKeepAlives: true,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          controller: ScrollController(),
          itemCount: isBook ? listOfBooks.length : _populaCorses.length,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
          itemBuilder:  (context , index){
            if(isBook){
              final Book tmp = listOfBooks[index];
              return Padding(
                padding: const EdgeInsets.only(right: AppPadding.p10),
                child: book_card(book: tmp),
              );
            }
           final course tmp = _populaCorses[index];
            return Padding(
              padding: const EdgeInsets.only(right: AppPadding.p10),
              child: cours_card(cours: tmp),
            );
          }
      ),
    );
  }
}






