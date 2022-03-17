import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:keyofscience/theme/components.dart';

import 'package:keyofscience/theme/kdefault.dart';
import 'package:keyofscience/pages/RECOMMENDED%20_COURSES.dart';

class PreferredCourses extends StatefulWidget {
  const PreferredCourses();

  @override
  _PreferredCoursesState createState() => _PreferredCoursesState();
}

class _PreferredCoursesState extends State<PreferredCourses> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: KbackgroundColor,
        appBar: appBar,
        body: Padding(
          padding: const EdgeInsets.only(
            right: 20,
            left: 20,
          ),
          child: Stack(
            children: [
              ListView(
                physics:  const BouncingScrollPhysics(),
                children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 8.0, bottom: 5, top: 20),
                    child: Text(
                      "lastly, searsh for courses",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          fontFamily: "Montserrat"),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "select what do you want to ",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                      ),
                      Text(
                        " learn",
                        style: TextStyle(
                            color: Colors.grey, fontFamily: "Montserrat"),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  GridList(
                    ontap: () {},
                    list: categries,
                  ),
                ],
              ),
              Positioned(
                  bottom: 20,
                  right: 0,
                  child: FloatingActionButton(
                    backgroundColor: Kselect,
                    onPressed: ()=>Navigator.push(
                      context, MaterialPageRoute(
                          builder: (_) => const RECOMMANDED_COURSES()),
                    ),
                    child: const Icon(Icons.navigate_next_rounded),
                  ),
              ),
            ],
          ),
        ),
      ),
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
      itemBuilder: (context, index) => GestureDetector(
        onTap: () {
          setState(() {});
          select = index;
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: index == select ? Kselect : KdefaultColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Text(
            widget.list[index].title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
