import 'package:flutter/material.dart';


import 'package:keyofscience/kdefault.dart';
import 'package:keyofscience/presentation/resources/values_manager.dart';

import '../ViewModel/OnBoarding_ViewModel.dart';

class PreferredCourses extends StatelessWidget {
  const PreferredCourses();

  @override
  Widget build(BuildContext context) {
    return ListView(
        padding: const EdgeInsets.only(right: 20, left: 20,),
        physics:  const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(
                right: AppPadding.p8,
                bottom: AppPadding.p5
                , top: AppPadding.p20),
            child: Text(
              "lastly, searsh for courses",
              style: Theme.of(context).textTheme.headline1,
              // style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.w900,
              //     fontFamily: "Montserrat"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 15, top: 5),
            child: Text(
              "select what do you want to learn",
              style: Theme.of(context).textTheme.caption,
              // style: TextStyle(
              //                             color: Colors.grey, fontFamily: "Montserrat"),
            ),
          ),
          GridList(
            ontap: () {},
            list: categries,
          ),
        ],
      );
  }
}

class GridList extends StatefulWidget {
  final Function() ontap;
  final List<categories> list;

  const GridList({required this.list, required this.ontap}) : super();

  @override
  State<GridList> createState() => _GridListState();

}

class _GridListState extends State<GridList> {
   int select = 0;
  final OnBoardingViewModel _viewModel = OnBoardingViewModel();
  @override
  void initState() {
    _viewModel.start1();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List>(
      stream: _viewModel.outputSelectItem,
      builder: (context,snapshot){
        print("snapshot ${snapshot.data}");
        return snapshot.hasData? GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            semanticChildCount: 2,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 170, crossAxisSpacing: 20, mainAxisSpacing: 20),
            itemCount: widget.list.length,
            itemBuilder: (context, index) => InkWell(
              onTap: ()=>_viewModel.onSelectedItem(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: snapshot.data!.contains(index) ? Kdefault.ButtonColor : Kdefault.KdefaultColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Text(
                  widget.list[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                ),
              ),
            )
        ) : Center();
      }
    );
  }
}

class categories {
  final String title;
  categories({this.title = ""});
}

List<categories> categries = [
  categories(title: 'DESIGN UI UX'),
  categories(title: 'WEB DEVLOPMENT'),
  categories(title: 'CYBER ECURETY'),
  categories(title: 'MOBILE DEVLOPMENT'),
  categories(title: 'GRAPHICMOYION'),
  categories(title: 'AI & MACHINE LEARNING'),
  categories(title: 'AI & MACHINE LEARNING'),
];
