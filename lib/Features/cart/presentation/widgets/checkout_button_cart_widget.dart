// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:e_commerce_app/Features/cart/domain/entities/order_entity.dart';
import 'package:e_commerce_app/Features/cart/presentation/blocs/add_item_firestore/add_item_firestore_bloc.dart';
import 'package:e_commerce_app/core/routes/app_route_const.dart';
import 'package:e_commerce_app/core/util/snackbar_message.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CheckoutButtonCartWidget extends StatefulWidget {
  final List<ItemEntity> itemsList;

  const CheckoutButtonCartWidget({
    super.key,
    required this.itemsList,
  });

  @override
  State<CheckoutButtonCartWidget> createState() =>
      _CheckoutButtonCartWidgetState();
}

class _CheckoutButtonCartWidgetState extends State<CheckoutButtonCartWidget> {
  final AddItemFirestoreBloc blocItemsFirestore = getIt<AddItemFirestoreBloc>();

  List<OrderEntity> orderList = [];
  OrderEntity orderEntity = const OrderEntity(items: [], id: 0);
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddItemFirestoreBloc, AddItemFirestoreState>(
      bloc: blocItemsFirestore,
      listener: (context, state) {
        if (state.status == AddItemFirestoreStatus.loaded) {
          // CustomDialog().showMessageDialog(
          //     context: context, message: state.message, isDetails: false);
          (context).pushNamed(MyAppRouteConst.cartCompleteFaildPage,
              pathParameters: {"isComplete": "true"});
        } else if (state.status == AddItemFirestoreStatus.loading) {
          // CustomDialog().showLoadingDialog(context: context);
          SnackBarMessage().showLoadingSnackBar(
              message: "Adding Order ....", context: context);
        } else if (state.status == AddItemFirestoreStatus.error) {
          // CustomDialog().showMessageDialog(
          //     context: context, message: state.message, isDetails: false);
          (context).pushNamed(MyAppRouteConst.cartCompleteFaildPage,
              pathParameters: {"isComplete": "false"});
        }
      },
      child: Padding(
        padding:
            EdgeInsets.only(top: 10.h, bottom: 5.h, left: 20.w, right: 20.w),
        child: MaterialButton(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          height: 48.h,
          minWidth: 328.w,
          color: const Color(0xff000DAE),
          onPressed: () {
            blocItemsFirestore.add(
              AddOrderEvent(orderList: widget.itemsList),
            );
          },
          child: Text(
            "Checkout",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
