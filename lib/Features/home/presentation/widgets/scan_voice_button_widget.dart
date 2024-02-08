// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class ScanVoiceButtonWidget extends StatelessWidget {
  final Widget child;
  final Function()? onPressed;
  const ScanVoiceButtonWidget({
    super.key,
    required this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      height: 44.h,
      // minWidth: 40.w,
      color: const Color(0xffF5F8FA),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
