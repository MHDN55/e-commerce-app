import 'package:e_commerce_app/Features/home/presentation/blocs/home/home_bloc.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/buttom_banner_home_search_bag_profile_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/caregories_list_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/custom_page_list_view_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/search_sscan_voice_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../injection_injectable_package.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc blocHome = getIt<HomeBloc>();

  @override
  void initState() {
    blocHome.add(GetCategoriesEvent());
    blocHome.add(GetFirstListViewEvent());
    blocHome.add(GetSecondListViewEvent());
    blocHome.add(GetThirdListViewEvent());
    super.initState();
  }

  TextEditingController searchController = TextEditingController();
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(height: 30.h),
              SearchScanVoiceBarWidget(searchController: searchController),
              SizedBox(height: 20.h),
              CategoriesListWidget(pageController: pageController),
              Expanded(
                child: PageView(
                  controller: pageController,
                  children: [
                    const CustomPageListViewWidget(),
                    Container(color: Colors.amber),
                    const CustomPageListViewWidget(),
                    Container(color: Colors.black),
                    const CustomPageListViewWidget(),
                    Container(color: Colors.green),
                  ],
                  onPageChanged: (value) {
                    blocHome.add(
                      ScrollEvent(position: pageController.page!.round()),
                    );
                  },
                ),
              ),
            ],
          ),
          const ButtomBannerHomeSearchBagProfileWidget(),
        ],
      ),
    );
  }
}
