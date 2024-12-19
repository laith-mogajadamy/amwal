import 'package:amwal/core/utils/appcolors.dart';
import 'package:amwal/core/utils/prefrences.dart';
import 'package:amwal/generated/l10n.dart';
import 'package:amwal/welcome/controller/enter_bloc.dart';
import 'package:amwal/welcome/presentation/OnBoarding/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EnterBloc>(
          create: (context) => EnterBloc()..add(Getuser()),
        ),
      ],
      child: BlocBuilder<EnterBloc, EnterState>(
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(393, 786),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                locale: const Locale('en'
                    // state.language,
                    ),
                localizationsDelegates: const [
                  S.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                supportedLocales: S.delegate.supportedLocales,
                debugShowCheckedModeBanner: false,
                title: 'Amwal',
                theme: ThemeData(
                  cardColor: Colors.white,
                  scaffoldBackgroundColor: AppColor.whiteColorBG,
                  cardTheme: const CardTheme(color: Colors.white),
                  // canvasColor: Colors.transparent,
                  // colorScheme: ColorScheme.fromSeed(
                  //   seedColor: Colors.black,
                  //   primary: Colors.black,
                  // ),
                  useMaterial3: true,
                ),
                home: const Splash(),
              );
            },
          );
        },
      ),
    );
  }
}
