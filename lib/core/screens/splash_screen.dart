import 'package:e_commerce_app/Features/welcoming/presentation/blocs/login_logout_cache_helper/login_logout_cache_helper_bloc.dart';
import 'package:e_commerce_app/core/routes/app_route_const.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});
//
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }
//
// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     getIt<LoginLogoutCacheHelperBloc>()
//         .add(LoginLogoutChachHelperSignInSignOutCaching());
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LoginLogoutCacheHelperBloc, LoginLogoutCacheHelperState>(
//       bloc: getIt<LoginLogoutCacheHelperBloc>(),
//       builder: (context, state) {
//         if (state is LoginLogoutCacheHelperCached) {
//           return Scaffold(
//             backgroundColor: Colors.white,
//             body: AnimatedSplashScreen(
//               nextScreen: nextScreen,
//               splash: "images/splash/Character_reading.png",
//               splashIconSize: 300,
//               backgroundColor: Colors.white,
//               splashTransition: SplashTransition.sizeTransition,
//               pageTransitionType: PageTransitionType.fade,
//               centered: true,
//               duration: 1000,
//             ),
//           );
//         }
//         return Container(
//           color: Colors.white,
//         );
//       },
//     );
//   }
// }
//
// class ScaffoldSplashScreen extends StatelessWidget {
//   final Widget nextScreen;
//   const ScaffoldSplashScreen({
//     super.key,
//     required this.nextScreen,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: AnimatedSplashScreen(
//         nextScreen: nextScreen,
//         splash: "images/splash/Character_reading.png",
//         splashIconSize: 300,
//         backgroundColor: Colors.white,
//         splashTransition: SplashTransition.sizeTransition,
//         pageTransitionType: PageTransitionType.fade,
//         centered: true,
//         duration: 1000,
//       ),
//     );
//   }
// }

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    getIt<LoginLogoutCacheHelperBloc>()
        .add(LoginLogoutChachHelperSignInSignOutCaching());
    super.initState();
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          BlocListener<LoginLogoutCacheHelperBloc, LoginLogoutCacheHelperState>(
        bloc: getIt<LoginLogoutCacheHelperBloc>(),
        listener: (context, state) {
          if (state is LoginLogoutCacheHelperCached) {
            if (!state.isOnboarding) {
              (context)
                  .pushReplacementNamed(MyAppRouteConst.welcomingFirstPage);
            } else {
              if (!state.isAuth) {
                (context)
                    .pushReplacementNamed(MyAppRouteConst.welcomingSecondPage);
              } else {
                (context).pushReplacementNamed(MyAppRouteConst.homePage);
              }
            }
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xff637CF9),
                Color(0xff849DFE),
                Color(0xffCAD0FD),
                Color(0xffB8D9FA),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
          alignment: Alignment.center,
          child: Image.asset(
            "images/splash/Character_reading.png",
            width: 250.w,
            height: 250.h,
          ),
        ),
      ),
    );
  }
}
