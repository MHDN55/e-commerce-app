import 'package:e_commerce_app/Features/home/presentation/widgets/scan_voice_button_widget.dart';
import 'package:e_commerce_app/Features/home/presentation/widgets/text_form_field_search_widget.dart';
import 'package:e_commerce_app/core/routes/app_route_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class SearchScanVoiceBarWidget extends StatelessWidget {
  const SearchScanVoiceBarWidget({
    super.key,
    required this.searchController,
  });

  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 13,
          child: SizedBox(
            height: 44.h,
            child: TextFormFieldSearchWidget(
              keyboardType: TextInputType.text,
              fieldHint: "Search Now",
              myController: searchController,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 3,
          child: ScanVoiceButtonWidget(
            child: Icon(Icons.favorite,color: const Color.fromARGB(255, 255, 121, 111),size: 18.h),
            onPressed: () {
              (context).pushNamed(MyAppRouteConst.favoritesPage);
            },
          ),
        ),
        const Expanded(child: SizedBox()),
        Expanded(
          flex: 3,
          child: ScanVoiceButtonWidget(
            child: SvgPicture.asset(
              "images/home/Iconly_Bulk_Voice.svg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
