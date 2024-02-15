// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:go_router/go_router.dart';
import '../routes/app_route_const.dart';
// import 'package:http/http.dart' as http;

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();

  print("title ======================== ${message.notification!.title}");

  print("body ======================== ${message.notification!.body}");

  print("payload ======================== ${message.data}");
}

class FirebaseApi {
  // late BuildContext context;

  final firebaseMessaging = FirebaseMessaging.instance;

  final androidChanle = const AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    description: 'This channel used for important notifications',
    importance: Importance.defaultImportance,
  );

  final localNotifications = FlutterLocalNotificationsPlugin();

  final GlobalKey<NavigatorState> navigatorKey =
      getIt<GlobalKey<NavigatorState>>();

  void handleMessage(RemoteMessage? message) async{
    debugPrint('----> $message');

    if (message != null) {
      debugPrint('----> $message');
      if (message.data['page'] == "cart") {
        await Future.delayed(const Duration(milliseconds: 1100));
        // ignore: use_build_context_synchronously
        navigatorKey.currentContext!.pushNamed(MyAppRouteConst.cartPage);
      }
    }
  }

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('mipmap/ic_launcher');

    const settings = InitializationSettings(
      android: android,
      iOS: iOS,
    );
    await localNotifications.initialize(
      settings,
      onDidReceiveNotificationResponse: (details) {
        final message = RemoteMessage.fromMap(jsonDecode(details.payload!));
        handleMessage(message);
      },
    );
    final platform = localNotifications.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();

    await platform?.createNotificationChannel(androidChanle);
  }

  Future initPushNotifications() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen(
      (message) {
        debugPrint('on message');
        final notification = message.notification;
        if (notification != null) {
          localNotifications.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                androidChanle.id,
                androidChanle.name,
                channelDescription: androidChanle.description,
                icon: 'mipmap/ic_launcher',
              ),
            ),
            payload: jsonEncode(message.toMap()),
          );
        }
      },
    );
  }

  Future<void> initNotification() async {
    try {
      await firebaseMessaging.requestPermission();

      final token = await firebaseMessaging.getToken();

      print("=============== token =============== $token");

      initPushNotifications();

      initLocalNotifications();
    } catch (e) {
      print("============== error ============== $e");
    }
  }
}

// sendNotification(String titleMessage, String bodyMessage) async {
//   var headersList = {
//     'Accept': '*/*',
//     'Content-Type': 'application/json',
//     'Authorization':
//         'key=AAAAnongGGA:APA91bE75rEMIL50myYHJ5wJQLhRuIgEQ1v82Ja5qQwWmVFRZ7VS1f_3bMxqz6GcMojY8DeZg5bL5mVT1WbNSj7L-5nZeotycjjW09ZJBYFlujEMwKRlb0qNI3CDo3o-0ovMb5JT0L-M'
//   };
//   var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

//   var body = {
//     "to":
//         "ftnaYjkkRVGTOHcwXKRRU3:APA91bHgFJokTpCtkY376fbYibWRRzfVBI4IER8Z5-pvWuTqeN7YuNWpFVcCblPieK0Px8vp7QUXbWG4c2EeUBRXKsGYkbUwpnXhp6av_VuBwYGwvz7I-V_2tNeb8nmb07k6RCFCExuV",
//     "notification": {
//       "title": titleMessage,
//       "body": bodyMessage,
//     }
//   };

//   var req = http.Request('POST', url);
//   req.headers.addAll(headersList);
//   req.body = json.encode(body);

//   var res = await req.send();
//   final resBody = await res.stream.bytesToString();

//   if (res.statusCode >= 200 && res.statusCode < 300) {
//     print(resBody);
//   } else {
//     print(res.reasonPhrase);
//   }
// }
