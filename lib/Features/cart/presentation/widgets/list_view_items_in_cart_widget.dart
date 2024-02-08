// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/Features/cart/presentation/blocs/add_delete_item/add_delete_item_bloc.dart';
import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/Features/cart/presentation/widgets/checkout_button_cart_widget.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';

class ListViewItemsInCartWidget extends StatefulWidget {
  const ListViewItemsInCartWidget({
    super.key,
  });

  @override
  State<ListViewItemsInCartWidget> createState() =>
      _ListViewItemsInCartWidgetState();
}

class _ListViewItemsInCartWidgetState extends State<ListViewItemsInCartWidget> {
  final AddDeleteItemBloc blocItems = getIt<AddDeleteItemBloc>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddDeleteItemBloc, AddDeleteItemState>(
      bloc: blocItems,
      builder: (context, stateI) {
        if (stateI.status == AddDeleteItemStatus.loaded) {
          if (stateI.itemsList.isEmpty) {
            return SizedBox(
              height: 463.h,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40.h),
                    alignment: Alignment.center,
                    child: Image.asset(
                      "images/cart/Empty.png",
                      width: 280.w,
                    ),
                  ),
                  Text(
                    "Your Shopping Card\nis Empty",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.sp),
                  ),
                ],
              ),
            );
          } else {
            return Column(
              children: [
                SizedBox(
                  height: 400.h,
                  child: ListView.builder(
                    itemCount: stateI.itemsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 8.h),
                        child: Container(
                          height: 85.h,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // image for the product
                              Image.asset("images/home/Imput_Image.png"),
                              // title and subtitle
                              SizedBox(
                                width: 180.w,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // title
                                    Text(
                                      stateI.itemsList[index].title,
                                      style: TextStyle(
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // subtitle
                                    Text(
                                      stateI.itemsList[index].subtitle,
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: const Color(0xff333333),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // buttons(+ -) and counter
                              Column(
                                children: [
                                  // increment button
                                  Expanded(
                                    child: MaterialButton(
                                      minWidth: 20.w,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      color: Colors.black,
                                      onPressed: () {
                                        blocItems.add(
                                          ItemsIncreamentEvent(
                                            itemId: index,
                                          ),
                                        );
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  // counter text
                                  Expanded(
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 55.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(4),
                                        color: Colors.transparent,
                                      ),
                                      child: Text(
                                          "${stateI.itemsList[index].counter}"),
                                    ),
                                  ),
                                  // decrement button
                                  Expanded(
                                    child: MaterialButton(
                                      minWidth: 20.w,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      color: Colors.black,
                                      onPressed: () {
                                        if (stateI.itemsList[index].counter >
                                            1) {
                                          blocItems.add(
                                            ItemsDecreamentEvent(
                                              itemId: index,
                                            ),
                                          );
                                        } else {
                                          blocItems.add(
                                            DeleteItemEvent(
                                              itemId: index,
                                            ),
                                          );
                                        }
                                        setState(() {});
                                      },
                                      child: const Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                CheckoutButtonCartWidget(
                  itemsList: stateI.itemsList,
                ),
              ],
            );
          }
        }
        return const LoadingWidget();
      },
    );
  }
}
