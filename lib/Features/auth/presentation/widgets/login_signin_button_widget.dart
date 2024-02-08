// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class LoginSininButtonWidget extends StatelessWidget {
  final String buttonText;
  void Function()? onPressedbutton;
  LoginSininButtonWidget({
    super.key,
    required this.buttonText,
    this.onPressedbutton,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      height: 43,
      minWidth: MediaQuery.sizeOf(context).width,
      color: const Color(0xff000DAE),
      onPressed: onPressedbutton,
      child: Text(
        buttonText,
        style: TextStyle(
            fontSize: 15.sp, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
