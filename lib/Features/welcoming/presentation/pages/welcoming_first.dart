import 'package:e_commerce_app/Features/welcoming/data/datasources/onboarding_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_const.dart';

class WelcomingFirstPage extends StatelessWidget {
  const WelcomingFirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  color: const Color(0xff849DFE),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  child: Image.asset(
                    "images/welcoming/PhoneMockUp.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width,
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Text(
                        "The Right Address For \nShopping Anyday",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 28.sp),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        "It is now very easy to reach the best quality \n among all the products on the internet!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: const Color(0xff979797),
                        ),
                      ),
                      SizedBox(height: 30.h),
                      MaterialButton(
                        shape: Border.all(
                            color: const Color(0xff000DAE), width: 2.w),
                        elevation: 0,
                        onPressed: () {
                          OnBoarding().cachingOnboarding(true);
                          GoRouter.of(context)
                              .goNamed(MyAppRouteConst.welcomingSecondPage);
                        },
                        color: Colors.white,
                        child: Text(
                          "Next",
                          style: TextStyle(
                            color: const Color(0xff000DAE),
                            fontSize: 11.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
