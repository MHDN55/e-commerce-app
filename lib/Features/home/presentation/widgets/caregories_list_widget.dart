import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';
import 'package:e_commerce_app/core/widgets/loading_small_widget.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoriesListWidget extends StatefulWidget {
  const CategoriesListWidget({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  State<CategoriesListWidget> createState() => _CategoriesListWidgetState();
}

class _CategoriesListWidgetState extends State<CategoriesListWidget> {
  final HomeBloc blocHome = getIt<HomeBloc>();
  // List<bool> isBigSizeList = [true, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: BlocBuilder<HomeBloc, HomeState>(
        bloc: blocHome,
        builder: (context, state) {
          if (state.statusCategory == HomeStatus.loading) {
            return const LoadingSmallWidget();
          } else if (state.statusCategory == HomeStatus.loaded) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.category.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: Row(
                    children: [
                      SizedBox(width: 10.w),
                      Text(
                        state.category[index].name.toString(),
                        style: TextStyle(
                            fontSize: state.position == index ? 18.sp : 12.sp),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                  onTap: () {
                    // print(index);
                    // print(widget.pageController.page!.round());
                    // for (var element in isBigSizeList) {
                    //   if (element == true) {
                    //     isBigSizeList = List.filled(6, false);
                    //   }
                    // }
                    // isBigSizeList[index] = true;
                    if (widget.pageController.page == index + 1 ||
                        widget.pageController.page == index - 1) {
                      widget.pageController.animateToPage(
                        index,
                        duration: Durations.long4,
                        curve: Easing.standard,
                      );
                    } else {
                      widget.pageController.jumpToPage(
                        index,
                      );
                    }
                    blocHome.add(ScrollEvent(position: index));
                  },
                );
              },
            );
          } else if (state.statusCategory == HomeStatus.error) {
            return const Center(child: Text("Error"));
          } else {
            return const LoadingSmallWidget();
          }
        },
      ),
    );
  }
}
