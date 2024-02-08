import 'package:e_commerce_app/Features/home/presentation/pages/search_page.dart';
import 'package:e_commerce_app/core/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class ButtomBannerHomeSearchBagProfileWidget extends StatelessWidget {
  const ButtomBannerHomeSearchBagProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h, right: 10.w, left: 10.w),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: List.filled(
              2,
              BoxShadow(
                blurRadius: 12,
                color: Colors.grey.shade300,
              ),
            ),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
            color: Colors.grey[200],
            // Colors.grey[400],
          ),
          height: 78.h,
          width: 351.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                child: SvgPicture.asset("images/home/Home_Icon.svg"),
              ),
              GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: CustomSearch());
                },
                child: SvgPicture.asset(
                    "images/home/Iconly_Light_outline_Search_2.svg"),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(MyAppRouteConst.cartPage);
                },
                child: SvgPicture.asset("images/home/Iconly_Light_Bag.svg"),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(MyAppRouteConst.profilePage);
                },
                child: SvgPicture.asset("images/home/Profile_icon.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
