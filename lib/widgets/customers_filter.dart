import 'package:amwal/generated/l10n.dart';
import 'package:amwal/widgets/font/black16text.dart';
import 'package:amwal/widgets/font/blue16text.dart';
import 'package:amwal/widgets/font/white16text.dart';
import 'package:amwal/widgets/search_text_field.dart';
import 'package:amwal/widgets/select_currency.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../core/utils/appcolors.dart';

class CustomersFilters extends StatelessWidget {
  const CustomersFilters({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: AppColor.whiteColorBG,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20.r),
          topLeft: Radius.circular(20.r),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.5),
            blurRadius: 50,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Blue16text(text: S.of(context).advancedsearch),
              SizedBox(
                width: 10.w,
              ),
              SvgPicture.asset(
                "assets/svg/sliders.svg",
                color: AppColor.appblueGray,
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          SearchTextField(controller: controller),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Black16text(
                    text: "${S.of(context).currency}: ",
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: const SelectCurrency(),
                  ),
                ],
              ),
              Row(
                children: [
                  Black16text(
                    text: "${S.of(context).bransh}: ",
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Black16text(
                text: "${S.of(context).agent}: ",
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Black16text(
                text: "${S.of(context).acounttybe}: ",
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              Black16text(
                text: "${S.of(context).city}: ",
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              fixedSize: Size(size.width / 1.1, size.height / 18),
              backgroundColor: AppColor.appblueGray,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: White16text(text: S.of(context).search)),
                SizedBox(
                  width: 10.w,
                ),
                Icon(
                  Icons.search,
                  color: AppColor.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
