import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_commerce_app/Features/profile/domain/entities/order_list_entity.dart';

// ignore: must_be_immutable
class OrderListWidget extends StatefulWidget {
  List<OrdersListEntity> orders;

  OrderListWidget({
    super.key,
    required this.orders,
  });

  @override
  State<OrderListWidget> createState() => _OrderListWidgetState();
}

class _OrderListWidgetState extends State<OrderListWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280.h,
      width: 320.w,
      child: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: widget.orders.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(vertical: 5.h),
            child: MaterialButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 600.h,
                        width: 360.w,
                        child: ListView.builder(
                          itemCount: widget.orders[index].items.length,
                          itemBuilder: (context, index2) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Container(
                                height: 85.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  gradient: const LinearGradient(
                                    colors: [
                                      Colors.orange,
                                      Colors.amber,
                                      Colors.yellow,
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // image for the product
                                    Image.asset("images/home/Imput_Image.png"),
                                    // title and subtitle
                                    SizedBox(
                                      width: 160.w,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // title
                                          Text(
                                            widget.orders[index].items[index2]
                                                .title,
                                            style: TextStyle(
                                              fontSize: 17.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          // subtitle
                                          Text(
                                            widget.orders[index].items[index2]
                                                .subtitle,
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: const Color(0xff333333),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // counter
                                    Center(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: 55.w,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: Colors.transparent,
                                        ),
                                        child: Text(
                                          "${widget.orders[index].items[index2].counter}",
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 20.sp,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: 85.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    gradient: const LinearGradient(
                      colors: [
                        Colors.orange,
                        Colors.amber,
                        Colors.yellow,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text("Order ${widget.orders[index].id}"),
                  ),
                )),
          );
        },
      ),
    );
  }
}
