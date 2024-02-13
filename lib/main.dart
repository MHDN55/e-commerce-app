// ignore_for_file: avoid_print
import 'dart:convert';
import 'package:e_commerce_app/firebase_options.dart';
import 'package:e_commerce_app/core/routes/app_route_config.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'injection_injectable_package.dart' as di;
import 'package:http/http.dart' as http;

void main() async {
  di.configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await ScreenUtil.ensureScreenSize();

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
    // FirebaseMessaging.onBackgroundMessage((message) async {
    //   (context).pushNamed(MyAppRouteConst.cartPage);
    // });
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print(
    //       "================================================${message.notification!.title}");
    // });

    FirebaseAuth.instance.authStateChanges().listen(
      (User? user) {
        if (user == null) {
          print('User is currently signed out!');
        } else {
          print('User is signed in!');
        }
      },
    );
    myGetToken();
    super.initState();
  }

  myGetToken() async {
    String? token = await FirebaseMessaging.instance.getToken();
    print("======================================================$token");
  }

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

sendNotification(String titleMessage, String bodyMessage) async {
  var headersList = {
    'Accept': '*/*',
    'Content-Type': 'application/json',
    'Authorization':
        'key=AAAAnongGGA:APA91bE75rEMIL50myYHJ5wJQLhRuIgEQ1v82Ja5qQwWmVFRZ7VS1f_3bMxqz6GcMojY8DeZg5bL5mVT1WbNSj7L-5nZeotycjjW09ZJBYFlujEMwKRlb0qNI3CDo3o-0ovMb5JT0L-M'
  };
  var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

  var body = {
    "to":
        "ftnaYjkkRVGTOHcwXKRRU3:APA91bHgFJokTpCtkY376fbYibWRRzfVBI4IER8Z5-pvWuTqeN7YuNWpFVcCblPieK0Px8vp7QUXbWG4c2EeUBRXKsGYkbUwpnXhp6av_VuBwYGwvz7I-V_2tNeb8nmb07k6RCFCExuV",
    "notification": {
      "title": titleMessage,
      "body": bodyMessage,
    }
  };

  var req = http.Request('POST', url);
  req.headers.addAll(headersList);
  req.body = json.encode(body);

  var res = await req.send();
  final resBody = await res.stream.bytesToString();

  if (res.statusCode >= 200 && res.statusCode < 300) {
    print(resBody);
  } else {
    print(res.reasonPhrase);
  }
}
