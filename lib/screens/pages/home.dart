import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/screens/customers/presentation/customer_page.dart';
import 'package:amwal/widgets/black16text.dart';
import 'package:amwal/widgets/black18text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List griddata = [
      [
        S.of(context).customers,
        "assets/svg/person orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).suppliers,
        "assets/svg/splayers orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).purchases,
        "assets/svg/cart orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).sales,
        "assets/svg/sales orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).warehouse,
        "assets/svg/warehouse orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).generalanalysis,
        "assets/svg/chart orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).humanresources,
        "assets/svg/HR orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
      [
        S.of(context).fundsandbanks,
        "assets/svg/fundes orange svg.svg",
        () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => CustomerPage(),
            ),
          );
        }
      ],
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
                  itemCount: griddata.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: griddata[index][2],
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 10.h, bottom: 10.h, right: 20.w, left: 20.w),
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
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Black16text(
                                    text: griddata[index][0],
                                  ),
                                ),
                                SvgPicture.asset(
                                  fit: BoxFit.scaleDown,
                                  griddata[index][1],
                                )
                              ],
                            ),
                          ),
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
