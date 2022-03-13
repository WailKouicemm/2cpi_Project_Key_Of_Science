import 'package:flutter/material.dart';

class DaysPreferred extends StatefulWidget {
      String text;
      Color couleur;
      Color boxcouleur;
    DaysPreferred({
     required this.boxcouleur,
     required this.text,
     required this.couleur,
      });
  @override
  State<DaysPreferred> createState() => _DaysPreferredState(text: text , couleur: couleur, boxcouleur: boxcouleur);
}

class _DaysPreferredState extends State<DaysPreferred> {
   Color boxcouleur;
   Color couleur;
   String text;
    _DaysPreferredState({
    required this.boxcouleur,
    required this.couleur,
    required this.text,
  }) ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
                      onTap: (){
                          setState(() {
                            
                          });
                          if (couleur == Colors.white){
                           couleur=const Color.fromRGBO(42,88,244,1);
                           boxcouleur=Colors.white;
                        } else {
                           couleur=Colors.white;
                           boxcouleur=const Color.fromRGBO(42,88,244,1);
                        }
                       
                        
                      },
                      child: 
                          Container(
                            height: 47.0,
                            width: 90.0,
                            decoration: BoxDecoration(
                              color: boxcouleur,
                              borderRadius: BorderRadius.circular(7.0),
                              border: Border.all(color: Color.fromRGBO(42,88,244,1), width: 2.0)
                            ),
                            child: Center(
                              child: Text(text , 
                              style: TextStyle(
                                   fontSize: 13.0,
                                   fontWeight: FontWeight.bold, 
                                    color: couleur),)),
                          ),
    );
  }
}

