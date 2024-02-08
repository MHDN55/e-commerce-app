// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_commerce_app/Features/favorite/presentation/blocs/bloc/favorite_bloc.dart';
import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce_app/Features/home/domain/entities/third_list_view_entity.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';

class CustomBestProcuctsItemsChairWidhet extends StatefulWidget {
  final String text;
  final String price;
  final int index;
  final bool isFavorite;
  final List<ThirdListViewEntity> thirdListView;
  const CustomBestProcuctsItemsChairWidhet({
    super.key,
    required this.text,
    required this.price,
    required this.index,
    required this.isFavorite,
    required this.thirdListView,
  });

  @override
  State<CustomBestProcuctsItemsChairWidhet> createState() =>
      _CustomBestProcuctsItemsChairWidhetState();
}

List<String> images = [
  "images/home/pngwing_2.png",
  "images/home/pngwing_2.png",
  "images/home/pngwing_2.png",
];

// FavoriteBloc blocFavorite = getIt<FavoriteBloc>();
class _CustomBestProcuctsItemsChairWidhetState
    extends State<CustomBestProcuctsItemsChairWidhet> {
  final HomeBloc blocHome = getIt<HomeBloc>();
  final FavoriteBloc blocfavorite = getIt<FavoriteBloc>();
  @override
  void initState() {
    blocfavorite.add(GetFavoritesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// List<ThirdListViewEntity> emptyList = [];
    return Padding(
      padding: EdgeInsets.all(15.0.h),
      child: Container(
        height: 200.h,
        width: 152.w,
        color: const Color(0xffFAFDFF),
// Colors.grey[400],
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 5.h),
              child: Image.asset(
                images[0],
                height: 108.h,
                width: 114,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: Text(
                        widget.text,
                        style: TextStyle(fontSize: 15.sp),
                      ),
                    ),
                    Text(
                      widget.price,
                      style: TextStyle(
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
                // BlocBuilder<HomeBloc, HomeState>(
                //   bloc: blocHome,
                //   builder: (context, state) {
                //     if (state.statusThirdListView == HomeStatus.loaded) {
                //       List<bool> isFavorited = List.filled(3, false);
                // for (var element in state.favoritesList) {
                //   if (element == widget.thirdListView[widget.index]) {
                //     isFavorited[widget.index] = true;
                //   }
                // }
                // print("===========================${widget.thirdListView[widget.index].isFavorite}");
                // print("=================================================${widget.isFavorite}");

                BlocBuilder<FavoriteBloc, FavoriteState>(
                  bloc: blocfavorite,
                  builder: (context, state2) {
                    if (state2.status == FavoriteStatus.changed) {
                      return IconButton(
                        onPressed: () {
                          ThirdListViewEntity thirdListViewEntity =
                              ThirdListViewEntity(
                            title: widget.thirdListView[widget.index].title,
                            price: widget.thirdListView[widget.index].price,
                            id: widget.thirdListView[widget.index].id,
                            isFavorite:
                                !state2.favoritesList[widget.index].isFavorite,
                          );
                          blocfavorite.add(UpdateFavoriteEvent(
                              favorite: thirdListViewEntity));

                          blocfavorite.add(GetFavoritesEvent());
                          // if (isFavorited[widget.index] == false) {
                          //   emptyList.add(widget.thirdListView[widget.index]);
                          //   blocFavorite.add(
                          //       AddFavoriteEvent(favoritesList: emptyList));
                          // } else {
                          //   emptyList.add(widget.thirdListView[widget.index]);
                          //   blocFavorite.add(
                          //       DeleteFavoriteEvent(favoritesList: emptyList));
                          // }
                          // blocHome.add(GetThirdListViewEvent());
                        },
                        icon: state2.favoritesList[widget.index].isFavorite
                            ? const Icon(Icons.favorite_rounded)
                            : const Icon(Icons.favorite_border_rounded),
                        //  isFavorited[widget.index] == false
                        //     ? const Icon(
                        //         Icons.favorite_border_rounded,
                        //       )
                        //     :
                        //  const Icon(
                        //     Icons.favorite_rounded,
                        //   ),
                      );
                    } else if (state2.status == FavoriteStatus.loading) {
                      return IconButton(
                        onPressed: () {},
                        icon: Icon(state2.favoritesList.isNotEmpty
                            ? state2.favoritesList[widget.index].isFavorite
                                ? Icons.favorite_rounded
                                : Icons.favorite_border_rounded
                            : Icons.favorite_border_rounded),
                      );
                    } else {
                      return IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.network_check_rounded,
                        ),
                      );
                    }
                  },
                ),
                // }
                // else if (state.status == HomeStatus.changedFavorite) {
                //   return IconButton(
                //     onPressed: () {
                //       ThirdListViewEntity thirdListViewEntity =
                //           ThirdListViewEntity(
                //         title: widget.thirdListView[widget.index].title,
                //         price: widget.thirdListView[widget.index].price,
                //         id: widget.thirdListView[widget.index].id,
                //         isFavorite:
                //             !widget.thirdListView[widget.index].isFavorite,
                //       );
                //       blocHome.add(UpdateFavoriteEvent(
                //           favorite: thirdListViewEntity));
                //     },
                //     icon: widget.isFavorite
                //         ? const Icon(Icons.favorite_rounded)
                //         : const Icon(Icons.favorite_border_rounded),
                //   );
                // }
                // else if (state.statusThirdListView == HomeStatus.loading) {
                //   return IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.connect_without_contact_rounded,
                //     ),
                //   );
                // } else {
                //   return IconButton(
                //     onPressed: () {},
                //     icon: const Icon(
                //       Icons.network_check_rounded,
                //     ),
                //   );
                // }
                //   },
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
