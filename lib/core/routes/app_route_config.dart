import 'package:e_commerce_app/Features/auth/presentation/pages/log_in_page.dart';
import 'package:e_commerce_app/Features/auth/presentation/pages/sign_in_page.dart';
import 'package:e_commerce_app/Features/cart/presentation/pages/cart_completed_faild_order_page.dart';
import 'package:e_commerce_app/Features/cart/presentation/pages/cart_page.dart';
import 'package:e_commerce_app/Features/details/presentation/pages/details_page.dart';
import 'package:e_commerce_app/Features/favorite/presentation/pages/favorites_page.dart';
import 'package:e_commerce_app/Features/home/presentation/pages/home_page.dart';
import 'package:e_commerce_app/Features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/Features/profile/presentation/pages/profile_page.dart';
import 'package:e_commerce_app/Features/welcoming/presentation/pages/welcoming_first.dart';
import 'package:e_commerce_app/Features/welcoming/presentation/pages/welcoming_second_page.dart';
import 'package:e_commerce_app/core/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_route_const.dart';

class MyAppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: MyAppRouteConst.splashScreen,
        path: '/',
        builder: (context, state) {
          return const SplashScreen();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.welcomingFirstPage,
        path: '/welcoming_first_page',
        builder: (context, state) {
          return const WelcomingFirstPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.welcomingSecondPage,
        path: '/welcoming_second_page',
        builder: (context, state) {
          return const WelcomingSecondPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.logInPage,
        path: '/login_page',
        builder: (context, state) {
          return const LogInPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.signInPage,
        path: '/signin_page',
        builder: (context, state) {
          return const SignInPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.homePage,
        path: '/home_page',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.searchPage,
        path: '/search_page',
        builder: (context, state) {
          return const SearchPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.detailsPage,
        path: '/details_page/:title/:subtitle/:image/:id',
        builder: (context, state) {
          return DetailsPage(
            title: state.pathParameters["title"]!,
            subtitle: state.pathParameters["subtitle"]!,
            image: state.pathParameters["image"]!,
            id: state.pathParameters["id"]!,
          );
        },
      ),
      GoRoute(
        name: MyAppRouteConst.cartPage,
        path: '/cart_page',
        builder: (context, state) {
          return const CartPage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.cartCompleteFaildPage,
        path: '/cart_complete_faild_page/:isComplete',
        builder: (context, state) {
          return CartCompleteFaildPage(
            isComplete: state.pathParameters['isComplete']!,
          );
        },
      ),
      GoRoute(
        name: MyAppRouteConst.profilePage,
        path: '/profile_page',
        builder: (context, state) {
          return const ProfilePage();
        },
      ),
      GoRoute(
        name: MyAppRouteConst.favoritesPage,
        path: '/favorites_page',
        builder: (context, state) {
          return const FavoritesPage();
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return const MaterialPage(child: WelcomingSecondPage());
    },
  );
}
