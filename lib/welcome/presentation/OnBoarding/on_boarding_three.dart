import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/widgets/white18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardingTree extends StatelessWidget {
  final String image;
  final String text1;
  const OnBoardingTree({
    super.key,
    required this.image,
    required this.text1,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          color: AppColor.appblueGray,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/AS logo white.svg",
                      fit: BoxFit.cover,
                      height: 60.h,
                      width: 60.w,
                    ),
                  ],
                ),
                Image.asset(
                  height: size.height / 2,
                  width: size.width / 1.3,
                  image,
                  fit: BoxFit.contain,
                ),
                White18text(text: text1),
                SizedBox(
                  height: 10.h,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppColor.whiteColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Container(
                      height: 10.h,
                      width: 10.w,
                      decoration: BoxDecoration(
                        color: AppColor.apporange,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
