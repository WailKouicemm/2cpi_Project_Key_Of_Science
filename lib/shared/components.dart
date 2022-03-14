import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget answerfield({
  required String text,
}) =>
  Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0
                ),
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
                      hintStyle: TextStyle(
                        fontSize: 14.0
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),),
                     ),
                  ),
                ),
              );
