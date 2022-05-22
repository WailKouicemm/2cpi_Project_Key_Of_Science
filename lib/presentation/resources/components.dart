import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'kdefault.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function() onpressed;
  final Color textColor, backgroundCOlor;

  LoginButton(
      {required this.text,
      required this.onpressed,
      required this.textColor,
      required this.backgroundCOlor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
      child: MaterialButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          elevation: 5.0,
          minWidth: 400.0,
          height: 45,
          color: backgroundCOlor,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16.0, color: textColor, fontFamily: "Montserrat"),
          ),
          onPressed: onpressed),
    );
  }
}

class TextFormFiledC extends StatefulWidget {
  final Color colour;
  final String text;
  final Icon icon;
  bool obscured;
  final TextInputType textInputType;
  final bool suffixicon;
  final double padding;
  TextFormFiledC({
    this.colour = KdefaultColor,
    required this.text,
    this.obscured = false,
    this.icon = const Icon(
      Icons.person,
      color: KdefaultColor,
    ),
    this.suffixicon = false,
    this.padding = 30,
     this.textInputType=TextInputType.name,
  });

  @override
  State<TextFormFiledC> createState() => _TextFormFiledCState();
}

class _TextFormFiledCState extends State<TextFormFiledC> {
  bool visibal = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.padding),
      child: TextFormField(
        autofocus: false,
        obscureText: widget.obscured,
        cursorColor: KdefaultColor,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          hintText: widget.text,
          contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
          hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
          prefixIcon: widget.icon,
          suffixIcon: widget.suffixicon
              ? IconButton(
              onPressed: () {
                setState(() {
                  widget.obscured
                      ? widget.obscured = false
                      : widget.obscured = true;
                });
              },
              icon: Icon(widget.obscured
                  ? Icons.visibility
                  : Icons.visibility_off))
              : const Icon(null),
        ),
        keyboardType: widget.textInputType,
      ),
    );
  }
}

class courses {
  courses({this.title = "", this.path = "", this.coursesnum = ""});

  final String path, title, coursesnum;
}

List<courses> populaCorses = [
  courses(
      path: 'assets/images/photoshop.jpg',
      title: 'complet photoshop course',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/illustrator.jpeg',
      title: 'Illustrator CC Full Course',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/ae.jpg',
      title: 'intoduction to ui utilization of after Effects',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/java.jpg',
      title: 'introduction to Java',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course.jpg',
      title: 'COURSES OFFRED',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course.jpg',
      title: 'UI/UX Courses',
      coursesnum: '29 lesson'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29 lesson'),
];

List<courses> webdevloppment = [
  courses(
      path: 'assets/images/web1.png', title: 'Full stack', coursesnum: '29'),
  courses(
      path: 'assets/images/web2.jpeg',
      title: 'Frontend Course',
      coursesnum: '29'),
  courses(
      path: 'assets/images/web3.jpeg',
      title: 'UI/UX COURSES',
      coursesnum: '29'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29'),
  courses(
      path: 'assets/images/course.jpg',
      title: 'UI/UX Courses',
      coursesnum: '29'),
  courses(
      path: 'assets/images/course2.png',
      title: 'UI/UX COURSES',
      coursesnum: '29'),
];

class CorsesListView extends StatelessWidget {
  CorsesListView({required this.coursess, required this.ontap});

  final List<courses> coursess;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double widh = MediaQuery.of(context).size.width;
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: coursess.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: ontap,
            child: Stack(
              children: [
                Container(
                  width: widh * 0.9,
                  height: 175,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(coursess[index].path),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 10),
                    child: SizedBox(
                      width: widh * 0.25,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            coursess[index].title,
                            style:  const TextStyle(
                                color: Colors.white, fontFamily: "Montserrat"),
                          ),
                          Text(
                            coursess[index].coursesnum,
                            style: const  TextStyle(
                                color: Colors.grey,
                                fontSize: 10,
                                fontFamily: "Montserrat"),
                          ),
                          Container(
                            child: const  Text(
                              'continue',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat"),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const  Color(0xFFCC40B2),
                            ),
                            padding: const  EdgeInsets.symmetric(
                                horizontal: 8, vertical: 2),
                          )
                        ],
                      ),
                    ),
                  ),
                  width: widh * 0.9,
                  height: 175,
                  margin: const  EdgeInsets.only(bottom: 20),
                  alignment: Alignment.bottomLeft,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.black.withOpacity(0.7)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

AppBar appBar = AppBar(
  flexibleSpace: Container(
    decoration:  const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/images/backround_appbar.png"),
            fit: BoxFit.cover)),
  ),
  title: logo,
  backgroundColor: Colors.white,
  actions: const [
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
    ),
     SizedBox(
      width: 3,
    ),
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
      child:   CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 2,
      ),
    ),
       SizedBox(
      width: 3,
    ),
    CircleAvatar(
      backgroundColor: KdefaultColor,
      maxRadius: 3,
      child:   CircleAvatar(
        backgroundColor: Colors.white,
        maxRadius: 2,
      ),
    ),
      SizedBox(
      width: 10,
    ),
  ],
);

Widget answerfield({
  required String text,
}) =>
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: 45.0,
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
      ),
    );

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
