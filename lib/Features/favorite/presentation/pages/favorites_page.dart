import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';
import 'package:e_commerce_app/core/widgets/loading_widget.dart';
import 'package:e_commerce_app/injection_injectable_package.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  HomeBloc blocHome = getIt<HomeBloc>();
  @override
  void initState() {
    blocHome.add(GetThirdListViewEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Favorites ❤️"),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
          onPressed: () {
            (context).pop();
          },
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        height: 630.8.h,
        width: 360.w,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 81, 110, 255),
              Color.fromARGB(255, 255, 87, 193),
              Color.fromARGB(255, 255, 82, 82),
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: BlocBuilder<HomeBloc, HomeState>(
          bloc: blocHome,
          builder: (context, state) {
            if (state.statusThirdListView == HomeStatus.loaded) {
              return ListView.builder(
                itemCount: state.thirdListView.length,
                itemBuilder: (context, index) {
                  // print(state.thirdListView[index].isFavorite );
                  if (state.thirdListView[index].isFavorite == true) {
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
                      child: Container(
                        height: 85.h,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            width: 2,
                            color: const Color.fromARGB(255, 115, 0, 255),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // image for the product
                            Image.asset("images/home/Imput_Image.png"),
                            // title and subtitle
                            SizedBox(
                              width: 160.w,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // title
                                  Text(
                                    state.thirdListView[index].title,
                                    style: TextStyle(
                                      fontSize: 17.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  // subtitle
                                  Text(
                                    state.thirdListView[index].price,
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
                                  borderRadius: BorderRadius.circular(4),
                                  color: Colors.transparent,
                                ),
                                child: Text(
                                  "${state.thirdListView[index].id}",
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
                  } else {
                    return SizedBox(height: 1.h);
                  }
                },
              );
            } else if (state.statusThirdListView == HomeStatus.loading) {
              return const LoadingWidget();
            } else if (state.statusThirdListView == HomeStatus.error) {
              return Center(
                child: Text(state.message),
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
