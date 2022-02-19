import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/modules/home/home_page.dart';
import 'package:nlw_payflow_flutter/modules/splash/splash_page.dart';
import 'package:nlw_payflow_flutter/modules/login/login_page.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(primaryColor: AppColors.primary),
      //home: const LoginPage(),
      initialRoute: "/",
      routes: {
        "/" : (context) => const SplashPage(),
        "/login" : (context) => const LoginPage(),
        "/home" : (context) => const HomePage(),
      },
    );
  }
}
