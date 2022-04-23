import 'package:flutter/material.dart';


import 'package:keyofscience/kdefault.dart';

class PreferredCourses extends StatefulWidget {
  const PreferredCourses();

  @override
  _PreferredCoursesState createState() => _PreferredCoursesState();
}

class _PreferredCoursesState extends State<PreferredCourses> {
  @override
  Widget build(BuildContext context) {
    return  ListView(
        padding: const EdgeInsets.only(right: 20, left: 20,),
        physics:  const BouncingScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 5, top: 20),
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

  const GridList({required this.list, required this.ontap});

  @override
  State<GridList> createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  int select = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      semanticChildCount: 2,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 170, crossAxisSpacing: 20, mainAxisSpacing: 20),
      itemCount: widget.list.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          setState(() {});
          select = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == select ? Kdefault.ButtonColor : Kdefault.KdefaultColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.list[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      )
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
