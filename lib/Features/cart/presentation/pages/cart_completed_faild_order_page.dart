// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/Features/cart/presentation/widgets/buttom_banner_cart_search_home_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CartCompleteFaildPage extends StatelessWidget {
  final String isComplete;
  const CartCompleteFaildPage({
    super.key,
    required this.isComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            (context).pop();
          },
        ),
        title: Text(
          isComplete == "true" ? "Order Complete" : "Order Faild",
          style: TextStyle(fontSize: 22.sp, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 400.h,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 20.h),
                  alignment: Alignment.center,
                  child: Image.asset(
                    isComplete == "true"
                        ? "images/cart/Complete.png"
                        : "images/cart/Failed.png",
                    width: 280.w,
                  ),
                ),
                Text(
                  "It is now very easy to reach the best quality\namong all the products on the internet!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: const Color(0xff979797),
                  ),
                ),
              ],
            ),
          ),
          isComplete == "false"
              ? Padding(
                  padding: EdgeInsets.only(
                      top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
                  child: MaterialButton(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3),
                    ),
                    height: 48.h,
                    minWidth: 328.w,
                    color: const Color(0xff000DAE),
                    onPressed: () {
                      (context).pop();
                    },
                    child: Text(
                      "Back To Cart",
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              : SizedBox(height: 63.h),
          const ButtomBannerCartSearchHomeProfileWidget(),
        ],
      ),
    );
  }
}
