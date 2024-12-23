import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/screens/pages/pages.dart';
import 'package:amwal/welcome/controller/enter_bloc.dart';
import 'package:amwal/welcome/presentation/Auth/login.dart';
import 'package:amwal/welcome/presentation/OnBoarding/obPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocListener<EnterBloc, EnterState>(
      listener: (context, state) {
        print("splash");
        print(state.message);
        print(state.islogedin);
        Future.delayed(
          const Duration(seconds: 2),
          () {
            bool? firsttime = Preferences.getIsFirstTime();

            if (firsttime!) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const OBPage(),
                ),
              );
            } else {
              if (state.islogedin == "true") {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyPages(),
                  ),
                );
              } else if (state.islogedin == "false") {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              }
            }
          },
        );
      },
      child: Scaffold(
        backgroundColor: AppColor.whiteColorBG,
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: Image.asset(
                  "assets/images/splash image.png",
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 100.h),
                child: SvgPicture.asset(
                  'assets/svg/splash logo.svg',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
