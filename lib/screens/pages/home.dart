import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/widgets/black18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List griddata = [
      [],
    ];

    return Scaffold(
      backgroundColor: AppColor.whiteColorBG,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: size.height / 4,
                color: AppColor.appbuleBG,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height / 10, right: 20.w, left: 20.w),
                child: Row(
                  children: [
                    Black18text(text: S.of(context).fastaccess),
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.9,
                  ),
                  itemCount: 8,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: EdgeInsets.only(
                          top: 10.h, bottom: 10.h, right: 15.w, left: 15.w),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.whiteColor,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.black.withOpacity(0.1),
                              blurRadius: 20,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
          Positioned(
            top: size.height / 8,
            left: size.width / 18,
            child: Container(
              height: size.height / 5,
              width: size.width / 1.11,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.black.withOpacity(0.25),
                    blurRadius: 20,
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
