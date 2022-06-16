import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/Video/CourseDetail.dart';
import 'package:keyofscience/presentation/main/Mybooks/view/MyBooks.dart';
import 'package:keyofscience/presentation/main/books/books_view.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:keyofscience/services/courses_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../presentation/main/CoursePage/view/CoursePage.dart';
import '../presentation/resources/FontsManager.dart';
import '../models/Models.dart';
import '../presentation/resources/Styles_Manager.dart';
import '../presentation/main/CoursePage/view/CoursePage.dart';



class cours_card extends StatelessWidget {
  final bool onBoarding;
   final course cours;
   final bool registerIn;
    cours_card({ required this.cours,this.onBoarding=false,this.registerIn=false});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final double cardWidth = onBoarding? width * 0.9 : width * 0.8;
    return Container(
      padding: EdgeInsets.symmetric(vertical: onBoarding? AppPadding.p8 : 0),
      alignment: Alignment.center,
        height: height * 0.24,
        child: GestureDetector(
        onTap: ()async{

          bool isRegistered = await verifyIFregistered_in_cours.isRegistered(cours.id);
          print("isRegisteredisRegistered $isRegistered");
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_)=>   isRegistered? CourseDetail(courseId: cours.id) : CourseScreen(cours: cours))
          );
        },
        child: Hero(
          tag: cours.image,
          child: Stack(
            children: [
              Container(
                width: cardWidth,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  image:   DecorationImage(
                    image: NetworkImage(cours.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius:BorderRadius.circular(AppRadius.r15),
                ),
              ),
              Container(
                  width: cardWidth,
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppRadius.r15),
                    color: Colors.black.withOpacity(0.2),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: AppPadding.p15 , bottom: AppPadding.p15),
                    width:  width * 0.35,
                    child: SingleChildScrollView(
                      child:  Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(cours.title ,
                            maxLines: 3,
                            maxFontSize: 12,
                            style: Theme.of(context).textTheme.subtitle1?.
                            copyWith(fontSize: FontSizeManager.s12),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                         Text(cours.lessonsNumber,
                            style: lightStyle(color: ColorManager.grey, fontSize: FontSizeManager.s10),),
                          const SizedBox(
                            height: 3,
                          ),
                          const _continue_text()

                        ],
                      ),
                    )
                  )
              ),
            ],
          ),
        )
      )
    );
  }
}


class  book_card extends StatefulWidget {
  final bool onBoarding;
  final Book book;
  book_card({ required this.book,this.onBoarding=false});

  @override
  State<book_card> createState() => _book_cardState();
}

class _book_cardState extends State<book_card> {
  @override
  void initState() {
     courses_service.IncerementViews(widget.book.id,isBooks: true);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final double cardWidth = widget.onBoarding? width * 0.9 : width * 0.8;
    return Container(
        padding: EdgeInsets.symmetric(vertical: widget.onBoarding? AppPadding.p8 : 0),
        alignment: Alignment.center,
        child: GestureDetector(
            onTap: ()async{
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_)=> BookPage_view(widget.book)),
              );
              await courses_service.IncerementClicks(widget.book.id,isBooks: true);
            },
            child: Hero(
              tag: widget.book.image,
              child: Stack(
                children: [
                  Container(
                    width: cardWidth,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      image:   DecorationImage(
                        image: NetworkImage(widget.book.image),
                        fit: BoxFit.cover,
                      ),
                      borderRadius:BorderRadius.circular(AppRadius.r15),
                    ),
                  ),
                  Container(
                      width: cardWidth,
                      alignment: Alignment.bottomLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppRadius.r15),
                        color: Colors.black.withOpacity(0.2),
                      ),
                      child: Container(
                          padding: const EdgeInsets.only(left: AppPadding.p15 , bottom: AppPadding.p15),
                          width:  width * 0.35,
                          child: SingleChildScrollView(
                            child:  Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(widget.book.title ,
                                  maxLines: 3,
                                  maxFontSize: 12,
                                  style: Theme.of(context).textTheme.subtitle1?.
                                  copyWith(fontSize: FontSizeManager.s12),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                const _continue_text()
                              ],
                            ),
                          )
                      )
                  ),
                ],
              ),
             )
        )
    );
  }
}


















class verifyIFregistered_in_cours{
 static Future<bool> isRegistered(String id)async{
    try{
      SharedPreferences inst = await SharedPreferences.getInstance();
      bool? registered = inst.getBool(id);
      if(registered==null) {
        return false;
      }
      return true;

    }catch (_){
      return false;
    }
  }

 static Future<void> register(String id)async{
    try{
      SharedPreferences inst = await SharedPreferences.getInstance();
      inst.setBool(id, true);
    }catch (_){}
  }

}






class _continue_text extends StatelessWidget {
  const _continue_text({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppPadding.p1),
        margin: const EdgeInsets.symmetric(horizontal: AppPadding.p10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.r10),
          color: ColorManager.pink,
        ),
        alignment: Alignment.center,
        child: const Text(' continue ' ,
          style: TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white
          ),
        )
    );
  }
}
