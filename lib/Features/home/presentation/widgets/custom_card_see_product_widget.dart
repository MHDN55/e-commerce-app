// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce_app/core/routes/app_route_const.dart';

class CustomCardSeeProductWidget extends StatefulWidget {
  final String text;
  final String priceAfter;
  final String priceBefore;
  final int index;
  final int id;

  const CustomCardSeeProductWidget({
    super.key,
    required this.text,
    required this.priceAfter,
    required this.priceBefore,
    required this.index,
    required this.id,
  });

  @override
  State<CustomCardSeeProductWidget> createState() =>
      _CustomCardSeeProductWidgetState();
}

class _CustomCardSeeProductWidgetState
    extends State<CustomCardSeeProductWidget> {
  List<String> images = [
    "images/home/sarah_dorweiler_gUPiTDBdRe4_unsplash.png",
    "images/home/sarah_dorweiler_gUPiTDBdRe4_unsplash.png",
    "images/home/sarah_dorweiler_gUPiTDBdRe4_unsplash.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffFAFDFF),
      height: 95.h,
      width: 329.w,
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "images/home/sarah_dorweiler_gUPiTDBdRe4_unsplash.png",
                  height: 64.h,
                  width: 64.w,
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.text,
                  style: TextStyle(
                    fontSize: 15.sp,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      widget.priceAfter,
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 16.w),
                      child: Text(
                        widget.priceBefore,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 10.sp,
                          color: const Color(0xff707070),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  elevation: 0,
                  height: 32.h,
                  minWidth: 88.w,
                  color: const Color(0xff000DAE),
                  onPressed: () {
                    (context).pushNamed(
                      MyAppRouteConst.detailsPage,
                      pathParameters: {
                        "title": widget.text,
                        "subtitle": widget.priceAfter,
                        "image": images[widget.index],
                        "id": widget.id.toString(),
                      },
                    );
                  },
                  child: Text(
                    "See product",
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: Colors.white,
                    ),
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
