import 'package:ai_awesome_message/ai_awesome_message.dart';
import 'package:flutter/material.dart';

void AwesomeMessag({required BuildContext context,required String title,required String message}){
  Navigator.push(
    context,
    AwesomeMessageRoute(
      awesomeMessage: AwesomeHelper.createAwesome(
          title: "Error", message: message,
          tipType: TipType.ERROR
      ),
      settings: const RouteSettings(name: "/messageRouteName"),
    ),
  );
}