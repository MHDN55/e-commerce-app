import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class GoogleFacebookButtonWidget extends StatelessWidget {
  final String buttonText ;
  final String buttonIcon ;
  const GoogleFacebookButtonWidget({super.key, required this.buttonText, required this.buttonIcon});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(
          width: 1,
          color: Color(0xff97AABD),
        ),
      ),
      height: 43,
      minWidth: 150.w,
      color: const Color(0xffFEFEFF),
      onPressed: () {},
      child: Row(
        children: [
          SvgPicture.asset(buttonIcon),
          Text(
            buttonText,
            style: TextStyle(
              fontSize: 12.sp,
              color: const Color(0xff97AABD),
            ),
          ),
        ],
      ),
    );
  }
}
