import 'dart:ui';

import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/auth/presentation/blocs/signin_signup/signin_signup_bloc.dart';
import 'package:e_commerce_app/Features/auth/presentation/widgets/google_facebook_button_widget.dart';
import 'package:e_commerce_app/Features/auth/presentation/widgets/login_signin_button_widget.dart';
import 'package:e_commerce_app/Features/auth/presentation/widgets/text_form_field_auth_widget.dart';
import 'package:e_commerce_app/core/util/snackbar_message.dart';
import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/app_route_const.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        primary: false,
        children: [
          Form(
            key: formState,
            child: Stack(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.topCenter,
                      height: MediaQuery.sizeOf(context).height / 1.7,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          tileMode: TileMode.decal,
                          colors: [
                            // Color(0xff000DAE),
                            Color(0xff849DFE),
                            Color(0xff8BA2FE),
                            Color(0xff849DFE),
                            Color(0xffC6C9FE),
                          ],
                        ),
                      ),
                    ),
                    BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Center(
                          child: Image.asset(
                            "images/auth/MaskGroup3.png",
                            fit: BoxFit.cover,
                            height: 400.h,
                            width: 320.w,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 80),
                      Row(
                        children: [
                          SvgPicture.asset("images/auth/Shape.svg"),
                          Text(
                            " Kleine.",
                            style: TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Let's Register.",
                        style: TextStyle(
                          fontSize: 34.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        children: [
                          Text(
                            "Do have an account? ",
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.white,
                            ),
                          ),
                          InkWell(
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: const Color(0xff919AF4),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              // Navigator.of(context)
                              //     .pushReplacementNamed("login_page");
                              GoRouter.of(context)
                                  .pushNamed(MyAppRouteConst.logInPage);
                            },
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      TextFormFieldAuthWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Email";
                          }
                          String pattern = r'[a-zA-Z]{2,}';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'At least two characters .';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.name,
                        isPassword: false,
                        fieldHint: "Name",
                        myController: nameController,
                      ),
                      SizedBox(height: 20.h),
                      TextFormFieldAuthWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Email";
                          }
                          String pattern = r'\w+@\w+\.\w+';
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return 'Invalid E-mail Address format.';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        isPassword: false,
                        fieldHint: "Email",
                        myController: emailController,
                      ),
                      SizedBox(height: 20.h),
                      TextFormFieldAuthWidget(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Password";
                          }
                          String pattern =
                              r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$";
                          RegExp regex = RegExp(pattern);
                          if (!regex.hasMatch(value)) {
                            return '''Password must be at least 8 characters,include a letter''';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.visiblePassword,
                        isPassword: true,
                        fieldHint: "Password",
                        myController: passwordController,
                      ),
                      SizedBox(height: 30.h),
                      BlocListener<SigninSignupBloc, SigninSignupState>(
                        bloc: getIt<SigninSignupBloc>(),
                        listener: (context, state) async {
                          if (state is SigninSignupLoading) {
                            return showDialog(
                              context: context,
                              builder: (context) {
                                return const LoadingWidget();
                              },
                            );
                          }
                          if (state is SigninSignupLoaded) {
                            // Navigator.of(context).pushNamed("login_page");
                            GoRouter.of(context)
                                .pushNamed(MyAppRouteConst.logInPage);
                          }
                          if (state is SigninSignupFailure) {
                            Navigator.of(context).pop();
                            SnackBarMessage().showErrorSnackBar(
                                message: state.message, context: context);
                          }
                        },
                        child: LoginSininButtonWidget(
                          buttonText: "Regester",
                          onPressedbutton: () {
                            if (formState.currentState!.validate()) {
                              getIt<SigninSignupBloc>().add(
                                SignUpEvent(
                                  user: UserEntity(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    name: nameController.text,
                                  ),
                                ),
                              );
                            } else {
                              // ignore: avoid_print
                              print("not valid");
                            }
                          },
                        ),
                      ),
                      SizedBox(height: 30.h),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Facebook button
                          GoogleFacebookButtonWidget(
                            buttonIcon: "images/auth/facebook_icon.svg",
                            buttonText: "   Facebook",
                          ),
                          // Google button
                          GoogleFacebookButtonWidget(
                            buttonIcon: "images/auth/gmail_icon.svg",
                            buttonText: "    Gmail",
                          ),
                        ],
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
