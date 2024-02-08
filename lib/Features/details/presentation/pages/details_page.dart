// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import 'package:e_commerce_app/Features/cart/domain/entities/item_entity.dart';
import 'package:e_commerce_app/Features/cart/presentation/blocs/add_delete_item/add_delete_item_bloc.dart';
import 'package:e_commerce_app/core/util/dialog_messages.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';

class DetailsPage extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String id;

  const DetailsPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.id,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final AddDeleteItemBloc blocItems = getIt<AddDeleteItemBloc>();
  bool isfoundedItem = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Color(0xffA8A8A8),
          ),
          onPressed: () {
            (context).pop();
          },
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 5.h, right: 10.w),
            child: Align(
              alignment: Alignment.topRight,
              child: MaterialButton(
                minWidth: 50.w,
                height: 50.h,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(360),
                ),
                onPressed: () {},
                child: SvgPicture.asset("images/details/Send.svg"),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // first part of the page(image , button for share and other for back)
          Expanded(
            flex: 15,
            child: Stack(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Container(
                        color: const Color(0xffF5F8FA),
                      ),
                    ),
                  ],
                ),
                // image,
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    "images/details/Product_3_imput_image.png",
                    width: 290.w,
                    height: 300.h,
                  ),
                ),
              ],
            ),
          ),
          // second part of the page (title , subtitle , size , color , add to cart button)
          Expanded(
            flex: 12,
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  // title
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 10.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontSize: 28.sp),
                      ),
                    ),
                  ),
                  // subtitle
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, top: 10.h),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        widget.subtitle,
                        style: TextStyle(
                          color: const Color(0xff5A5A5A),
                          fontSize: 15.sp,
                        ),
                      ),
                    ),
                  ),
                  // divider
                  Padding(
                    padding: EdgeInsets.only(
                        left: 20.w, top: 10.h, right: 20.w, bottom: 10.h),
                    child: Divider(
                      thickness: 1.h,
                      color: const Color(0xffE8E8E8),
                    ),
                  ),
                  // color and size
                  SizedBox(
                    height: 60.h,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          // the color choise
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(right: 10.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Color",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xffD8F0D6),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xffFFE9D9),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff9598FE),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffB8D9FA),
                                            width: 2.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff7FBCFE),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // the size choise
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Size",
                                    style: TextStyle(fontSize: 15.sp),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff97AABD),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                        child: Center(
                                          child: Text(
                                            "S",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff97AABD),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                        child: Center(
                                          child: Text(
                                            "M",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff97AABD),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                        child: Center(
                                          child: Text(
                                            "L",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: const Color(0xffB8D9FA),
                                            width: 2.w,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(360),
                                          color: const Color(0xff97AABD),
                                        ),
                                        width: 24.w,
                                        height: 24.h,
                                        child: Center(
                                          child: Text(
                                            "XL",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // button (add to cart)
                  Padding(
                    padding: EdgeInsets.only(top: 25.h),
                    child: BlocBuilder<AddDeleteItemBloc, AddDeleteItemState>(
                      bloc: blocItems,
                      builder: (context, state) {
                        if (state.status == AddDeleteItemStatus.loaded) {
                          return MaterialButton(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            height: 48.h,
                            minWidth: 328.w,
                            color: const Color(0xff000DAE),
                            onPressed: () {
                              final itemEntity = ItemEntity(
                                id: int.parse(widget.id),
                                counter: 1,
                                title: widget.title,
                                subtitle: widget.subtitle,
                              );
                              for (var element in state.itemsList) {
                                if (element.id == itemEntity.id) {
                                  isfoundedItem = true;
                                  CustomDialog().showMessageDialog(
                                    context: context,
                                    message: "Item is Already in Cart",
                                    isDetails: true,
                                  );
                                }
                              }
                              if (isfoundedItem == false) {
                                blocItems.add(AddItemEvent(item: itemEntity));
                                CustomDialog().showMessageDialog(
                                  context: context,
                                  message: "Item Added",
                                  isDetails: true,
                                );
                              }
                            },
                            child: Text(
                              "Add to Cart",
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
