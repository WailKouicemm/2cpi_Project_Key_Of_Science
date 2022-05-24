import 'package:flutter/material.dart';
 import 'package:flutter/services.dart';
import 'package:keyofscience/Widgets/Course_card.dart';

import 'models/Models.dart';











   List<course> populaCorses = [
  course(
      image: 'assets/images/photoshop.jpg',
      title: 'complet photoshop course',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/illustrator.jpeg',
      title: 'Illustrator CC Full Course',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/ae.jpg',
      title: 'intoduction to ui utilization of after Effects',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/java.jpg',
      title: 'introduction to Java',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course.jpg',
      title: 'COURSES OFFRED',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course.jpg',
      title: 'UI/UX Courses',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      lessonsNumber: '29 lesson'),
];


 List<course> Mycourses = [

  course(
      image: 'assets/images/photoshop.jpg',
      title: 'complet photoshop course',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/illustrator.jpeg',
      title: 'Illustrator CC Full Course',
      lessonsNumber: '29 lesson'),
  course(
      image: 'assets/images/ae.jpg',
      title: 'intoduction to ui utilization of after Effects',
      lessonsNumber: '29 lesson'),
];










class CorsesListView extends StatelessWidget {
  CorsesListView({required this.coursess, required this.ontap});

  final List<course> coursess;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: coursess.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => SizedBox(
          height:  height * 0.22,
          child:  cours_card(cours: coursess[index],onBoarding: true,),
        )

      );
  }
}



class answerfield extends StatelessWidget {
  final String text;
  const answerfield({required this.text});

  @override
  Widget build(BuildContext context) {


    return  Container(
        height: 45.0,
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: TextFormField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: text,
            hintStyle:  const TextStyle(fontSize: 14.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      );
  }
}


class DaysPreferred extends StatefulWidget {
 final String text;
 final Color couleur;
 final Color boxcouleur;

  DaysPreferred({required this.boxcouleur, required this.text, required this.couleur,});

  @override
  State<DaysPreferred> createState() => _DaysPreferredState(text: text, couleur: couleur, boxcouleur: boxcouleur);


}

class _DaysPreferredState extends State<DaysPreferred> {
  Color boxcouleur;
  Color couleur;
  String text;

  _DaysPreferredState({
    required this.boxcouleur,
    required this.couleur,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
        if (couleur == Colors.white) {
          couleur = const Color.fromRGBO(42, 88, 244, 1);
          boxcouleur = Colors.white;
        } else {
          couleur = Colors.white;
          boxcouleur = const Color.fromRGBO(42, 88, 244, 1);
        }
      },
      child: Container(
        height: 47.0,
        width: 90.0,
        decoration: BoxDecoration(
            color: boxcouleur,
            borderRadius: BorderRadius.circular(7.0),
            border:
                Border.all(color: const Color.fromRGBO(42, 88, 244, 1), width: 2.0)),
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              fontSize: 13.0, fontWeight: FontWeight.bold, color: couleur),
        )),
      ),
    );
  }
}





class UserImage extends StatelessWidget {
  final String img;
  const UserImage({required this.img});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      maxRadius: 25,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage(img ==''? 'assets/images/man.jpg' : img),
    );
  }
}
