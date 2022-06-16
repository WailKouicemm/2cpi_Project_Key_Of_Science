import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:keyofscience/model/task.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper{
  FlutterLocalNotificationsPlugin
  flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin(); 

  initializeNotififaction()async{
    tz.initializeTimeZones();
    _configureLocalTimezone();
    final IOSInitializationSettings initializationSettingsIOS =
     IOSInitializationSettings(
         requestSoundPermission: false,
         requestBadgePermission: false,
         requestAlertPermission: false,
         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final AndroidInitializationSettings initializationSettingsAndroid =
     AndroidInitializationSettings("apicon");

  final InitializationSettings initializationSettings =
        InitializationSettings(
       iOS: initializationSettingsIOS,
       android:initializationSettingsAndroid,
    );
  await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: selectNotification);
  }

    scheduledNotification(int hour , int minute , Taskk task) async {

     await flutterLocalNotificationsPlugin.zonedSchedule(
         0,
         '${task.title}',
         'be ready! you have a task after ${task.remind} minutes',

         _convertTime(hour , minute),
         //tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
         const NotificationDetails(
             android: AndroidNotificationDetails('your channel id',
                 'your channel name',)),
         androidAllowWhileIdle: true,
         uiLocalNotificationDateInterpretation:
             UILocalNotificationDateInterpretation.absoluteTime,
             matchDateTimeComponents: DateTimeComponents.time
             );

   }

   tz.TZDateTime _convertTime(int hour , int minute){
     final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
     tz.TZDateTime scheduleDate =
               tz.TZDateTime(tz.local, now.year , now.month , now.day , hour , minute);
     if(scheduleDate.isBefore(now)){
       scheduleDate = scheduleDate.add(const Duration(days:1));
     }          
     return scheduleDate;
   }

    _configureLocalTimezone()async{
     tz.initializeTimeZones();
     final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
     tz.setLocalLocation(tz.getLocation(currentTimeZone));

   }

    displayNotification({required String title, required String body}) async {
    print("doing test");
    var androidPlatformChannelSpecifics =  new  AndroidNotificationDetails(
        'your channel id', 'your channel name',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      '$title',
      '$body',
      platformChannelSpecifics,
      payload: 'It could be anything you pass',
    );
  }

  
  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
      alert: true,
      badge: true,
      sound: true,
    );
  }

   Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }
     Get.to(()=>Container(color: Colors.white,));
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
  Get.dialog(Text("welcom to flutter"));
  }
}