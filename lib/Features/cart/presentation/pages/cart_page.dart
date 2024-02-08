// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/Features/cart/presentation/widgets/buttom_banner_cart_search_home_profile_widget.dart';
import 'package:e_commerce_app/Features/cart/presentation/widgets/list_view_items_in_cart_widget.dart';
import 'package:go_router/go_router.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            (context).pop();
          },
        ),
        title: Text(
          "My Cart",
          style: TextStyle(fontSize: 22.sp, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Column(
        children: [
          // list view items with check out button
          ListViewItemsInCartWidget(),
          ButtomBannerCartSearchHomeProfileWidget(),
        ],
      ),
    );
  }
}
