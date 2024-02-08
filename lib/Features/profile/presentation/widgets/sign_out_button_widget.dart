import 'package:e_commerce_app/Features/auth/presentation/blocs/signin_signup/signin_signup_bloc.dart';
import 'package:e_commerce_app/core/routes/app_route_const.dart';
import 'package:e_commerce_app/core/util/dialog_messages.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignOutButtonWidget extends StatefulWidget {
  const SignOutButtonWidget({
    super.key,
  });

  @override
  State<SignOutButtonWidget> createState() => _SignOutButtonWidgetState();
}

class _SignOutButtonWidgetState extends State<SignOutButtonWidget> {
  final SigninSignupBloc blocSigninSignOut = getIt<SigninSignupBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninSignupBloc, SigninSignupState>(
      bloc: blocSigninSignOut,
      listener: (context, state) {
        if (state is SigninSignupLoaded) {
          GoRouter.of(context).pushReplacementNamed(MyAppRouteConst.signInPage);
        } else if (state is SigninSignupLoading) {
          CustomDialog().showLoadingDialog(context: context);
        } else if (state is SigninSignupFailure) {
          CustomDialog().showMessageDialog(
            context: context,
            message: state.message,
            isDetails: false
          );
        } else {
          CustomDialog().showLoadingDialog(context: context);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: MaterialButton(
          height: 50.h,
          minWidth: 320.w,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
            side: BorderSide(
              color: const Color.fromARGB(255, 53, 53, 53),
              width: 2.w,
            ),
          ),
          onPressed: () {
            blocSigninSignOut.add(SignOutEvent());
          },
          child: Text(
            "Sign Out",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 53, 53, 53),
            ),
          ),
        ),
      ),
    );
  }
}
