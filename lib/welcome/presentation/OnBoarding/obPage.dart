import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/welcome/presentation/OnBoarding/on_boarding_one.dart';
import 'package:amwal/welcome/presentation/OnBoarding/on_boarding_three.dart';
import 'package:amwal/welcome/presentation/OnBoarding/on_boarding_two.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OBPage extends StatefulWidget {
  const OBPage({super.key});

  @override
  State<OBPage> createState() => _OBPageState();
}

class _OBPageState extends State<OBPage> {
  final controller = LiquidController();

  int currentpage = 0;

  @override
  Widget build(BuildContext context) {
    final pages = [
      const OnBoardingOne(
        image: "assets/images/OB 1 image.png",
        text1:
            "استعلام الحركات اليومية المحاسبية للمنشآت المختلفة النشاط، سواء كانت صناعية أو تجارية. ",
      ),
      const OnBoardingTwo(
        image: "assets/images/OB 2 image.png",
        text1:
            "استعراض تقارير الحسابات العامة والزبائن والموردين وحركة المواد والتصنيع في المخازن.",
      ),
      const OnBoardingTree(
        image: "assets/images/OB 2 image.png",
        text1: "مع تطبيق أموال، تستطيع تتبع أعمالك بسهولة واحترافية. ",
      ),
    ];

    return Scaffold(
      backgroundColor: (controller.currentPage == 1)
          ? AppColor.whiteColorBG
          : AppColor.appblueGray,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: LiquidSwipe(
              initialPage: 0,
              enableLoop: false,
              liquidController: controller,
              onPageChangeCallback: onPageChangeCallback,
              pages: pages,
              enableSideReveal: false,
              preferDragFromRevealedArea: true,
              waveType: WaveType.liquidReveal,
              slideIconWidget: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 25.r,
                  )),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(bottom: 10.h),
          //   child: ElevatedButton(
          //     style: ElevatedButton.styleFrom(
          //       backgroundColor: AppColor.whiteColorBG,
          //       shape: const StadiumBorder(),
          //     ),
          //     onPressed: () {
          //       page1a2a3(context);
          //     },
          //     child: Padding(
          //       padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
          //       child: Text(
          //         "   التالي   ",
          //         style: TextStyle(fontSize: 20.sp, color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  void onPageChangeCallback(int activePageIndex) {
    currentpage = activePageIndex;
    setState(() {});
  }

  void page1a2a3(BuildContext context) {
    if (controller.currentPage != 2) {
      int nextpage = controller.currentPage + 1;
      controller.animateToPage(
        page: nextpage,
      );
    } else {
      Preferences.saveIsFirstTime(false);
      Navigator.of(context).pushReplacementNamed("/pages");
    }
  }
}
