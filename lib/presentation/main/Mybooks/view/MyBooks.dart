import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:keyofscience/Widgets/Course_card.dart';
import 'package:keyofscience/models/Models.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';

import '../../../../components.dart';
import '../../../resources/FontsManager.dart';
import '../../../resources/Styles_Manager.dart';

import '../../../resources/appStrings.dart';
import '../../../resources/values_manager.dart';
import '../../homeScreen/view/MainScreen.dart';
import '../../main_Viewmodel.dart';



class my_courses extends StatelessWidget {
  const my_courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getThemeData(),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: ListView(
          children: [
            Title_Text(txt: "My courses", seAll: false),
            _my_courses_listView()
          ],
        ),
      ),
    );
  }
}

class _my_courses_listView extends StatelessWidget {
  const _my_courses_listView();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<course>>(
      future: myCourses_service.getMycourses(),
      builder: (context, snapshot)=>snapshot.hasData?
      (snapshot.data!.isEmpty? SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: Center(
          child: Text("you have no courses yet"),
        )
      ) : ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: snapshot.data!.length,
        itemBuilder: (context,index){
          course tmp = snapshot.data![index];
          return Padding(
            padding: EdgeInsets.all(10),
            child: cours_card(cours: tmp,onBoarding: true,registerIn: true,),
          );
        },
      )
      ): SizedBox(
        height: MediaQuery.of(context).size.height/2,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      )
    );
  }
}



class Mybooks extends StatelessWidget {
  const Mybooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: size.height *0.34,
                  width: double.infinity,
                  color: ColorManager.defaultColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CircleAvatar(
                        maxRadius: 57,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          maxRadius: 55,
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage('assets/images/man.jpg'),
                        ),
                      ),
                      FutureBuilder<String>(
                        future: usernameManage.getUsername(),
                        builder: (_,snapshot)=> Text( (snapshot.data ?? ''),
                            style: boldStyle(color: ColorManager.white,fontSize: FontSizeManager.s20,fontWeight: FontWeight.w700)
                        ),
                      ),
                      SizedBox(
                        height: 35,
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: -15,
                  right: -35,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    minRadius: 60,
                  ),
                ),
                Positioned(
                  left: -100,
                  top: 50 ,
                  child: CircleAvatar(
                    backgroundColor: Colors.white.withOpacity(0.2),
                    minRadius: 60,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const  EdgeInsets.symmetric(horizontal: AppPadding.p25 ),
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width:size.width *0.5,
                    margin: const  EdgeInsets.only(bottom: AppMargin.m20,),
                    child: AutoSizeText(
                        AppStrings.YourBooks ,
                        maxLines: 2,
                        minFontSize: FontSizeManager.s20,
                        maxFontSize: FontSizeManager.s20,
                        style: Theme.of(context).textTheme.headline1
                    ),
                  ),

              FutureBuilder<List<Book>>(
                  future: myCourses_service.get_myBooks(),
                  builder: (context, snapshot)=>snapshot.hasData?
                  (snapshot.data!.isEmpty? SizedBox(
                      height: MediaQuery.of(context).size.height/2,
                      child: Center(
                        child: Text("you have no courses yet"),
                      )
                  ) : ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context,index){
                      Book tmp = snapshot.data![index];
                      return Padding(
                        padding: EdgeInsets.all(10),
                        child: book_card(book: tmp,onBoarding: true,),
                      );
                    },
                  )
                  ): SizedBox(
                    height: MediaQuery.of(context).size.height/2,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ),
                  // CorsesListView(coursess: Mycourses,ontap: (){},),
                ],
              ),

            )
          ],
        ),
      ),
    );;
  }
}


class myCourses_service{
  static final String email = FirebaseAuth.instance.currentUser!.email ?? '';
  static Future<List<course>> getMycourses()async{
    try{
      List<course> myList = [];
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_courses");
      var res = await inst.orderBy("date",descending: true).get();
      if(res.docs.isNotEmpty){
        for (var element in res.docs) {
          myList.add(course.fromJson(element.data()));
        }
      }
      return myList;
    }catch (_){
      return [];
    }
  }
  
  static Future<void> add_myCoursese(course cours)async{
    try{
       final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_courses");
       await inst.add({
        'Title' : cours.title,
         'Enrollment' : cours.id,
         'Summary' : cours.content,
         'image' : cours.image,
         'date' : Timestamp.now(),
      });
 
     }catch (_){
     }
  }


  static Future<void> add_mmyBooks(String id)async{
    try{
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_books");
      await inst.add({
        "id" : id,
        "date" : Timestamp.now()
      });

    }catch (_){
    }
  }

  static Future<List<Book>> get_myBooks()async{
    try{
      List<Book> myList = [];
      final inst = FirebaseFirestore.instance.collection("mine_books_corses").doc(email).collection("my_books");
      var res = await inst.orderBy("date",descending: true).get();
      if(res.docs.isNotEmpty){
        for (var element in res.docs) {
          Book book = await getBook(element.data()['id']);
          myList.add(Book.fromJson(element.data()));
        }
      }
      return myList;
    }catch (_){
      return [];
    }
  }

  static Future<Book> getBook(String id)async{

      final inst = FirebaseFirestore.instance.collection("books").where("id",isEqualTo: id);
      var res = await inst.get();
      Book book = Book.fromJson(res.docs[0].data());
      print(book);
      return book;

  }

}



