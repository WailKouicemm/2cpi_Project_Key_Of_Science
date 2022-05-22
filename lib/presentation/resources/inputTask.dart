import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
class inputTask extends StatelessWidget {
  final String titleField;
  final String hintField;
  final TextEditingController? conroller;
  final Widget? widget;
  const inputTask({Key? key,
    required this.titleField,
    required this.hintField,
    this.conroller,
    this.widget,
  }
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20,left: 20,top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(titleField),
          Container(
            height: 48,
            padding: const EdgeInsets.only(left: 15),
            margin: const EdgeInsets.only(top:8),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(7),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                  readOnly: widget==null?false:true,
                  autofocus: false,
                  controller: conroller,
                  decoration: InputDecoration(
                    hintText: hintField,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    ),
                    enabledBorder:UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    ),
                  ),
                ),
                ),
                widget==null?Container():Container(child:widget,)
              ],
            ),

          )
        ],
      ),
    );
  }
}
