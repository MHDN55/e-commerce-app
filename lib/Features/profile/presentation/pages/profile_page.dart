// import 'package:e_commerce_app/Features/profile/presentation/widgets/sign_out_button_widget.dart';
// ignore_for_file: avoid_print

import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

import 'package:e_commerce_app/Features/profile/presentation/blocs/added_items/added_items_bloc.dart';
import 'package:e_commerce_app/Features/profile/presentation/widgets/order_list_widget.dart';
import 'package:e_commerce_app/Features/profile/presentation/widgets/sign_out_button_widget.dart';
import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  AddedItemsBloc blocAddedItems = getIt<AddedItemsBloc>();
  @override
  void initState() {
    blocAddedItems.add(GetUserEvent());
    blocAddedItems.add(GetAddedOrdersEvent());
    super.initState();
  }

  bool isMale = true;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    return Scaffold(
      extendBodyBehindAppBar: true,
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
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 630.8.h,
        width: 360.w,
        decoration: const BoxDecoration(
          gradient: SweepGradient(
            colors: [
              Color(0xff637CF9),
              Color(0xff849DFE),
              Color(0xffCAD0FD),
              Color(0xffB8D9FA),
            ],
          ),
        ),
        child: BlocBuilder<AddedItemsBloc, AddedItemsState>(
          bloc: blocAddedItems,
          builder: (context, state) {
            if (state.status == AddedItemsStatus.loaded) {
              return Column(
                children: [
                  // tow texts and profile pic in row
                  Padding(
                    padding:
                        EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // text (name - email)
                        SizedBox(
                          height: 80.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // name text
                              Text(
                                state.user[0].name,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // email text
                              Padding(
                                padding: EdgeInsets.only(top: 8.h),
                                child: Text(
                                  state.user[0].email,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: const Color(0xff6B6B6B),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // profile pic
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(360),
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.orange,
                                    Colors.amber,
                                    Colors.yellow,
                                  ],
                                ),
                                color: Colors.white,
                              ),
                              height: 100.h,
                              width: 100.w,
                              child: state.status == AddedItemsStatus.loading
                                  ? const LoadingWidget()
                                  : state.status ==
                                          AddedItemsStatus.imageChanged
                                      ? state.image == ""
                                          ? Image.asset(
                                              "images/profile/profile.png",
                                              scale: 14,
                                            )
                                          : Image.network(state.image)
                                      : Text(state.message),
                            ),
                            InkWell(
                              onTap: () async {
                                final ImagePicker picker = ImagePicker();
                                final XFile? imageGallery = await picker
                                    .pickImage(source: ImageSource.gallery);
                                final file = File(imageGallery!.path);
                                var imageName = basename(imageGallery.path);

                                blocAddedItems.add(
                                  AddProfileImageEvent(
                                      image: imageName, file: file),
                                );
                              },
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: const Color(0xff637CF9),
                                    fontSize: 16.sp),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // text (My Order)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h, bottom: 10.h),
                    child: Text(
                      "My Order",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // order list
                  OrderListWidget(orders: state.orders),
                  // sign out button
                  const SignOutButtonWidget(),
                ],
              );
            } else if (state.status == AddedItemsStatus.loading) {
              return const LoadingWidget();
            } else if (state.status == AddedItemsStatus.error) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(fontSize: 16.sp),
                ),
              );
            } else {
              return const LoadingWidget();
            }
          },
        ),
      ),
    );
  }
}
