import 'package:e_commerce_route/config/theme/AppTheme.dart';
import 'package:e_commerce_route/presentation/home/home_screen.dart';
import 'package:e_commerce_route/presentation/signin_user/SignIn_Screen.dart';
import 'package:e_commerce_route/presentation/signup_user/SignUp_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/utils/routes_manager.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'e_commerce_route',
        routes: {
          RoutesManager.HomeRouteName:(_)=> HomeScreen(),
          RoutesManager.SignInScreen:(_)=> SignInScreen(),
          RoutesManager.SignUpScreen :(_)=> SignUpScreen()
        },
        theme:AppTheme.lightTheme ,
        themeMode: ThemeMode.light,
        initialRoute:RoutesManager.SignInScreen ,
        debugShowCheckedModeBanner: false,

      ),
    );
  }
}
