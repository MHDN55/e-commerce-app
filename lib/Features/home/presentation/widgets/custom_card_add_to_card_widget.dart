// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_const.dart';

class CustomCardAddToCardWidget extends StatefulWidget {
  final String text;
  final String price;
  final int index;
  final int id;
  const CustomCardAddToCardWidget({
    super.key,
    required this.text,
    required this.price,
    required this.index,
    required this.id,
  });

  @override
  State<CustomCardAddToCardWidget> createState() =>
      _CustomCardAddToCardWidgetState();
}

class _CustomCardAddToCardWidgetState extends State<CustomCardAddToCardWidget> {
  List<String> images = [
    "images/home/Imput_Image.png",
    "images/home/Imput_Image.png",
    "images/home/Imput_Image.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137.h,
      width: 240.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: const Color(0xffFAFDFF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsetsDirectional.only(start: 15),
              child: Image.asset(images[0]),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          SizedBox(height: 20.h),
                          Text(
                            widget.text,
                            overflow: TextOverflow.fade,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            widget.price,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: const Color(0xff333333),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: MaterialButton(
                        height: 32.h,
                        minWidth: 32.w,
                        color: const Color(0xffFF9999),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onPressed: () {},
                        child: SvgPicture.asset(
                          "images/home/Iconly_Light_Heart.svg",
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    MaterialButton(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.zero,
                          topLeft: Radius.zero,
                          topRight: Radius.zero,
                          bottomRight: Radius.circular(4),
                        ),
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
                            "subtitle": widget.price,
                            "image": images[widget.index],
                            "id": widget.id.toString(),
                          },
                        );
                      },
                      child: Text(
                        "See Details",
                        style: TextStyle(
                          fontSize: 11.sp,
                          color: Colors.white,
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
    );
  }
}
