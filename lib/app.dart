import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:nlw_payflow_flutter/modules/home/home_page.dart';
import 'package:nlw_payflow_flutter/modules/insert_boleto/insert_bolet_page.dart';
import 'package:nlw_payflow_flutter/modules/splash/splash_page.dart';
import 'package:nlw_payflow_flutter/modules/login/login_page.dart';
import 'package:nlw_payflow_flutter/shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pay Flow",
      theme: ThemeData(primaryColor: AppColors.primary, primarySwatch: Colors.orange),
      //home: const LoginPage(),
      initialRoute: "/",
      routes: {
        "/" : (context) => const SplashPage(),
        "/login" : (context) => const LoginPage(),
        "/home" : (context) => const HomePage(),
        "/barcode_scanner" : (context) => const BarcodeScannerPage(),
        "/insert_boleto" : (context) => const InsertBoletoPage(),
      },
    );
  }
}
