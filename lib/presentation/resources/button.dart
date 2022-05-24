import 'package:flutter/material.dart';
import 'package:keyofscience/presentation/resources/ColorManager.dart';
class Button extends StatelessWidget {
  final String label;
  final Function()? onTap;
  const Button({Key? key,required this.label,required this.onTap, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:Container(
        width: 90,
        height: 46,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17),
          color: ColorManager.defaultColor,
        ),
        child:Center(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ),
    );
  }
}
