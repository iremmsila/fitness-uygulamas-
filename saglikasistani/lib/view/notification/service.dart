import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:grock/grock.dart';

class FirebaseNotificationService{
  late final FirebaseMessaging messaging;

  void settingNotification()async{
    await messaging.requestPermission(
      alert: true,
      sound: true,
      badge: true
    );
  }

  void connectNotfication()async{
    await Firebase.initializeApp();
    messaging = FirebaseMessaging.instance;
    messaging.setForegroundNotificationPresentationOptions(
      alert: true,
      sound: true,
      badge: true
    );

    FirebaseMessaging.onBackgroundMessage(backgroundMessage);
    settingNotification();
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      Grock.snackBar(title: "${event.notification?.title}",
      description: "${event.notification?.body}",
      leading:event.notification?.android?.imageUrl == null ? null
      : Image.network("${event.notification?.android?.imageUrl}",
      width: 80,height: 80,),
      opacity: 0.5,
      position: SnackbarPosition.top);
      print("gelen bildirim baslığı: ${event.notification?.title}");
    });

    messaging.getToken().then((value) => log("Token: $value", name:"FCM TOKEN"));
  }

  static Future<void> backgroundMessage(RemoteMessage message)async{
    await Firebase.initializeApp();

    print("Handling a background message: ${message.messageId}");
  }
}
