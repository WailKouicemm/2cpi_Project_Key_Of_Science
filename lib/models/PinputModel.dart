import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

Widget buildPinPut() {
    return Pinput(
      defaultPinTheme: const PinTheme(
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow:  [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(
                        -4.0,
                        5.0,
                      ),
                      blurRadius: 3.0,
                      spreadRadius: -2.0,
                    ), 
                  ],
        )
      ),
      onCompleted: (pin) => print(pin),
    );
  }