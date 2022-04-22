import 'package:flutter/material.dart';
import 'package:keyofscience/components.dart';

import '../models/Course_model.dart';



class Cours_card extends StatelessWidget {
  final course cours;
  const Cours_card({required this.cours});


  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: null,
      child: Stack(
        children: [
          Container(
            width:  width * 0.8,
            margin: const EdgeInsets.only(right: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: const DecorationImage(image: AssetImage("assets/images/java.jpg"),fit: BoxFit.cover),
              borderRadius:BorderRadius.circular(15),
            ),
          ),
          Container(
              width:  width * 0.8,
              margin:  const EdgeInsets.only(right: 10),
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.4)
              ),
              child: Container(
                padding: const EdgeInsets.only(left: 10 , bottom: 10),
                width:  width * 0.25,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(cours.title , style: const TextStyle(color: Colors.white),),
                    Text(cours.coursesnum , style: const TextStyle(color: Colors.grey , fontSize: 10),),
                    InkWell(
                      onTap: (){},
                      child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.pink,
                          ),
                          child: contuniueText(),
                      ),
                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
