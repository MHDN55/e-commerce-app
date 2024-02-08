import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class TextFormFieldSearchWidget extends StatelessWidget {
  final TextInputType keyboardType;

  final String fieldHint;
  final TextEditingController myController;
  final GlobalKey<FormState> formState = GlobalKey();
  TextFormFieldSearchWidget({
    super.key,
    required this.keyboardType,
    required this.fieldHint,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
 
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
      ],
      controller: myController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffix: SvgPicture.asset("images/home/Iconly_Light_Search.svg"),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusColor: const Color(0xffCCCCCC),
        contentPadding: const EdgeInsets.all(8),
        fillColor: const Color(0xffF5F8FA),
        filled: true,
        hintText: fieldHint,
        hintStyle: TextStyle(
          color: const Color(0xff97AABD),
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
