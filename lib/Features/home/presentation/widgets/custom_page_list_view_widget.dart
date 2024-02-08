import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/custom_best_products_iitems_chair_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/custom_card_add_to_card_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/custom_card_see_product_widget.dart';
import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../injection_injectable_package.dart';

class CustomPageListViewWidget extends StatefulWidget {
  const CustomPageListViewWidget({
    super.key,
  });

  @override
  State<CustomPageListViewWidget> createState() =>
      _CustomPageListViewWidgetState();
}

class _CustomPageListViewWidgetState extends State<CustomPageListViewWidget> {
  final HomeBloc blocHome = getIt<HomeBloc>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: blocHome,
      builder: (context, state) {
        return ListView(
          children: [
            // first list view
            SizedBox(
              height: 160.h,
              width: 360.w,
              child: state.statusFirstListView == HomeStatus.loaded
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.firstListView.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 10.w),
                            CustomCardAddToCardWidget(
                              id: state.firstListView[index].id,
                              index: index,
                              text: state.firstListView[index].title,
                              price: state.firstListView[index].price,
                            ),
                            SizedBox(width: 10.w),
                          ],
                        );
                      },
                    )
                  : state.statusFirstListView == HomeStatus.loading
                      ? const LoadingWidget()
                      : state.statusFirstListView == HomeStatus.error
                          ? const Center(child: Text("Error"))
                          : const LoadingWidget(),
            ),
            // const text time
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Text(
                "11:03:28",
                style: TextStyle(
                  fontSize: 11.sp,
                  color: const Color(0xff808080),
                ),
              ),
            ),
            // const text (Best Deals)
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 10.h),
              child: Text(
                "Best Deals",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // second list view
            SizedBox(
              height: 100.h,
              width: 360.w,
              child: state.statusSecondListView == HomeStatus.loaded
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.secondListView.length,
                      itemBuilder: (context, index) {
                        return CustomCardSeeProductWidget(
                          id: state.secondListView[index].id,
                          index: index,
                          text: state.secondListView[index].title,
                          priceAfter: state.secondListView[index].priceAfter,
                          priceBefore: state.secondListView[index].priceBefore,
                        );
                      },
                    )
                  : state.statusSecondListView == HomeStatus.loading
                      ? const LoadingWidget()
                      : state.statusSecondListView == HomeStatus.error
                          ? const Center(child: Text("Error"))
                          : const LoadingWidget(),
            ),
            // const text (Best Products)
            Padding(
              padding: EdgeInsets.only(left: 30.w, bottom: 10.h, top: 5.h),
              child: Text(
                "Best Products",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            // third list view
            SizedBox(
              height: 210.h,
              width: 360.w,
              child: state.statusThirdListView == HomeStatus.loaded
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.thirdListView.length,
                      itemBuilder: (context, index) {
                        return CustomBestProcuctsItemsChairWidhet(
                          text: state.thirdListView[index].title,
                          price: state.thirdListView[index].price,
                          isFavorite: state.thirdListView[index].isFavorite,
                          index: index,
                          thirdListView: state.thirdListView,
                        );
                      },
                    )
                  : state.statusThirdListView == HomeStatus.loading
                      ? const LoadingWidget()
                      : state.statusThirdListView == HomeStatus.error
                          ? const Center(child: Text("Error"))
                          : const LoadingWidget(),
            ),
            //padding for buttom after third list view
            SizedBox(
              height: 60.h,
            ),
          ],
        );
      },
    );
  }
}
