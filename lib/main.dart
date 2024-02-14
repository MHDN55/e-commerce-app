// ignore_for_file: avoid_print

import 'package:e_commerce_app/core/notification_api/firebase_api.dart';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/core/routes/app_route_config.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_injectable_package.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotification();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      if (message.notification != null) {
        print(
            "==================================${message.notification!.title}");
      }
    });

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );
    // myGetToken();
    mySubscribeToTopicFunc();
    super.initState();
  }

  // myGetToken() async {
  //   String? token = await FirebaseMessaging.instance.getToken();
  //   print("======================================================$token");
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp.router(
        // theme: ThemeData(useMaterial3: false),
        routerConfig: MyAppRouter.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   print("==================================${message.notification!.body}");
// }

mySubscribeToTopicFunc() async {
  await FirebaseMessaging.instance.subscribeToTopic('LOL');
}
