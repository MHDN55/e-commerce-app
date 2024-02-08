// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFormFieldAuthWidget extends StatelessWidget {
  final TextInputType keyboardType;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String fieldHint;
  final TextEditingController myController;
  final GlobalKey<FormState> formState = GlobalKey();
  TextFormFieldAuthWidget({
    super.key,
    required this.keyboardType,
    required this.isPassword,
    this.validator,
    required this.fieldHint,
    required this.myController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r"\s\b|\b\s")),
      ],
      controller: myController,
      keyboardType: keyboardType,
      obscureText: isPassword,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
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
        ),
      ),
    );
  }
}
