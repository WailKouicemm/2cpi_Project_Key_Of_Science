import 'package:flutter/material.dart';
import 'package:ai_awesome_message/ai_awesome_message.dart';

void AwesomeMessag({required BuildContext context,required String title,required String message, type = TipType.ERROR}){
  Navigator.push(
    context,
    AwesomeMessageRoute(
      awesomeMessage: AwesomeHelper.createAwesome(
          title: type==TipType.ERROR?  "Error" : "Success", message: message,
          tipType: type
      ),
      settings: const RouteSettings(name: "/messageRouteName"),
    ),
  );
}

