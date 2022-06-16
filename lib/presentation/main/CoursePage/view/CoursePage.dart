import 'package:flutter/material.dart';
import 'package:keyofscience/Widgets/Course_card.dart';
import 'package:keyofscience/components.dart';
import 'package:keyofscience/presentation/main/Mybooks/view/MyBooks.dart';
import 'package:keyofscience/presentation/resources/FontsManager.dart';
import 'package:keyofscience/presentation/resources/ThemeManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/presentation/resources/images.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:readmore/readmore.dart';

import '../../../../models/Models.dart';
import '../../../Video/CourseDetail.dart';
import '../../../resources/ColorManager.dart';
import '../../../resources/Styles_Manager.dart';

class CourseScreen extends StatefulWidget {
  final course cours;
  const CourseScreen({required this.cours});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      theme: getThemeData().copyWith(
        appBarTheme: AppBarTheme(
          iconTheme: const IconThemeData(
            color: ColorManager.defaultColor,
          ),
          titleTextStyle: semiBoldStyle(
              color: ColorManager.black,
          ),
          centerTitle: true,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: const Color(0xFFF2F2F2),
        appBar: AppBar(
          flexibleSpace: Image.asset(images.appBarImage,fit: BoxFit.fill),
          leading: IconButton(
              onPressed: ()=>Navigator.pop(context),
              icon: const Icon(Icons.arrow_back),),
          title: Text(widget.cours.title,),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// this is the course image
              Padding(
                padding: const EdgeInsets.only(top: AppPadding.p25, left: AppPadding.p12, right: AppPadding.p12),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// cours image
                      Hero(
                        tag: widget.cours.image,
                        child: GestureDetector(
                          onTap: (){
                            // Navigator.of(context).push(
                            //     MaterialPageRoute(
                            //         builder: (_)=>ImagePage(imagesList: [cours.image],
                            //           currentpage: 0,))
                            // );
                          },
                          child: Container(
                              height: height/4,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(AppRadius.r15),
                                image: DecorationImage(
                                  image: NetworkImage(widget.cours.image),
                                  fit: BoxFit.fill,
                                ),
                                boxShadow:  <BoxShadow>[
                                  BoxShadow(
                                    color: ColorManager.grey.withOpacity(0.05),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.only(bottom: AppMargin.m4),
                            ),
                        ),
                      ),
                      /// cours creatoe and rating
                      Padding(
                        padding: const EdgeInsets.fromLTRB(AppPadding.p4, 0, AppPadding.p4, AppPadding.p10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: " Dr.  ",
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: [
                                    TextSpan(
                                        text:widget.cours.creator,
                                        style: Theme.of(context).textTheme.caption
                                      //     const TextStyle(
                                      //       fontWeight: FontWeight.w900, fontSize: 9.0),
                                    ),
                                  ]
                              ),
                            ),
                           Column(
                             children: [
                               Row(
                                 children: const  [
                                   Icon(Icons.star_border, size: 13.8, color: ColorManager.blue,),
                                   Text(
                                     '4.5',
                                     style: TextStyle(
                                         color: Colors.grey,
                                         fontSize: 9,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ],
                               ),
                               Row(
                                 children:   [
                                   const Icon(Icons.remove_red_eye_outlined, size: 13.8, color: ColorManager.blue,),
                                   Text(
                                     " "+widget.cours.views.toString(),
                                     style: const TextStyle(
                                         color: Colors.grey,
                                         fontSize: 9,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ],
                               ),
                               Row(
                                 children:   [
                                   const Icon(Icons.ads_click, size: 13.8, color: ColorManager.blue,),
                                   Text(
                                     " "+widget.cours.clicks.toString(),
                                     style: const TextStyle(
                                         color: Colors.grey,
                                         fontSize: 9,
                                         fontWeight: FontWeight.bold),
                                   ),
                                 ],
                               ),
                             ],
                           )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppPadding.p10),
                        child: Text(widget.cours.title,
                          style: Theme.of(context).textTheme.headline1!.copyWith(fontSize: FontSizeManager.s24),),
                      )
                    ]
                ),
              ),
              /// the desciption and those stuff
              Padding(
                padding: const EdgeInsets.only(left: AppPadding.p45),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 27,),
                    Text(
                        'Description :',
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: FontSizeManager.s17)
                      //   TextStyle(fontSize: 17.0, fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: AppHeight.h10,),
                    ReadMoreText(
                      widget.cours.content
                        ,
                        trimLines: 3,
                        style: Theme.of(context).textTheme.caption,
                        colorClickableText: ColorManager.defaultColor,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: AppStrings.showMore,
                        trimExpandedText: AppStrings.showLess,
                        moreStyle: Theme.of(context).textTheme.bodyText1
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    Text(
                        'The Course Includes',
                        style: Theme.of(context).textTheme.bodyText1?.
                        copyWith(fontSize: FontSizeManager.s18,fontWeight: FontWeightManager.bold)
                      // TextStyle(fontSize: 17.0, fontWeight: FontWeight.w900),
                    ),
                    const coursInculdeItem(text: '   20 Hours Video', icon:  Icons.article_outlined,),
                    const coursInculdeItem(text: '   Total 60+ Lessons', icon:  Icons.insert_drive_file_outlined,),
                    const coursInculdeItem(text: '   20 Quiz', icon: Icons.question_mark),
                  ],
                ),
              ),
              /// start button
              Container(
                margin: const EdgeInsets.only(
                    top: AppMargin.m40,
                    left: AppMargin.m12,
                    right: AppMargin.m12,
                    bottom: AppMargin.m20),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(AppRadius.r30)),
                height: 45.0,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: ()async{
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CourseDetail(courseId: widget.cours.id,)),
                      );
                    });
                    await myCourses_service.add_myCoursese(widget.cours);
                    await verifyIFregistered_in_cours.register(widget.cours.id);
                  },
                  child: const Text("Start"),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}


class coursInculdeItem extends StatelessWidget {
  final String text;
  final IconData icon;
  const coursInculdeItem({required this.text,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: AppPadding.p10),
      child: Row(
        children: [
           CircleAvatar(
            minRadius: 13.0,
            backgroundColor: ColorManager.selectColor2,
            child:  Icon(
              icon,
              size: 20.0,
              color: ColorManager.white,
            )
          ),
          Text(
              text,
              style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeightManager.bold)
            // TextStyle(
            //     color: Colors.grey,
            //     fontSize: 13.0,
            //     fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
