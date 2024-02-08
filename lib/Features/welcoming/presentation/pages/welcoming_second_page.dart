import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_const.dart';


class WelcomingSecondPage extends StatelessWidget {
  const WelcomingSecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topCenter,
                  height: MediaQuery.sizeOf(context).height / 1.7,
                  width: MediaQuery.sizeOf(context).width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      tileMode: TileMode.decal,
                      colors: [
                        // Color(0xff000DAE),
                        Color(0xff849DFE),
                        Color(0xff8BA2FE),
                        Color(0xff849DFE),
                        Color(0xffC6C9FE),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                Column(
                  children: [
                    Center(
                      child: Image.asset(
                        "images/welcoming/MaskGroup2.png",
                        fit: BoxFit.cover,
                        height: 340.h,
                        width: 320.w,
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Text(
                                  "The Right Address For \nShopping \nAnyday",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 28.sp),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  "It is now very easy to reach the best \nquality among all the products on the \ninternet!",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 11.sp,
                                    color: const Color(0xff979797),
                                  ),
                                ),
                                SizedBox(height: 30.h),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    MaterialButton(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      height: 43.h,
                                      minWidth: 120.w,
                                      color: const Color(0xff000DAE),
                                      onPressed: () {
                                        // Navigator.of(context)
                                        //     .pushNamed("signin_page");
                                        GoRouter.of(context).pushNamed(MyAppRouteConst.signInPage);
                                      },
                                      child: Text(
                                        "Regester",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    MaterialButton(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      height: 43,
                                      minWidth: 120.w,
                                      color:
                                          //  const Color(0xffF5F8FA),
                                          Colors.grey[200],
                                      onPressed: () {
                                        // Navigator.of(context)
                                        //     .pushNamed("login_page");
                                        context.pushNamed(MyAppRouteConst.logInPage);
                                      },
                                      child: Text(
                                        "Log In",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
