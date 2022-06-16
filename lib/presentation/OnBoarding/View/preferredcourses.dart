import 'package:flutter/material.dart';


import 'package:keyofscience/presentation/resources/ColorManager.dart';
import 'package:keyofscience/presentation/resources/appStrings.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';
import 'package:provider/provider.dart';

import '../../../models/Models.dart';
import '../../main/Courses/view/CoursesScreen.dart';
import '../ViewModel/OnBoarding_ViewModel.dart';

class PreferredCourses extends StatelessWidget {
  const PreferredCourses();

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        physics:  const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: AppPadding.p8,
                bottom: AppPadding.p5
                ,top: AppPadding.p20),
            child:
            Text(
                AppStrings.onBoardingTitle2,
                style: Theme.of(context).textTheme.headline1
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 15, top: 5),
            child: Text(
              AppStrings.onBoardingSubTitle,
              style: Theme.of(context).textTheme.caption,
              // style: TextStyle(
              //                             color: Colors.grey, fontFamily: "Montserrat"),
            ),
          ),
          GridList(
            ontap: () {},
            list: course_categories,
          ),
        ],
      );
  }
}

class GridList extends StatefulWidget {
  final Function() ontap;
  final List<String> list;

  const GridList({required this.list, required this.ontap}) : super();

  @override
  State<GridList> createState() => _GridListState();

}

class _GridListState extends State<GridList> {
   int select = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        semanticChildCount: 2,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 170, crossAxisSpacing: 20, mainAxisSpacing: 20),
        itemCount: widget.list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: ()=>Provider.of<selectedItemProvier>(context,listen: false).onItemSelected(widget.list[index]),
          child: Selector<selectedItemProvier,bool>(
            selector: (context,provider)=>provider.selectedItems.contains(widget.list[index]),
           shouldRebuild: (prev,next)=> prev!=next,
           builder: (context,selected,_)=> AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selected? ColorManager.selectColor : ColorManager.defaultColor,
                  borderRadius: BorderRadius.circular(AppRadius.r30),
                ),
                child: Text(
                  widget.list[index],
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
          )

        ),
    );
  }
}

