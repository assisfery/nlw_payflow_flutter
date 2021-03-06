import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_payflow_flutter/modules/login/login_controller.dart';
import 'package:nlw_payflow_flutter/shared/widget/social_login/social_login_button.dart';

import '../../shared/themes/app_colors.dart';
import '../../shared/themes/app_images.dart';
import '../../shared/themes/app_text_styles.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: size.height * 0.36,
            ),
            Positioned(
                right: 0,
                left: 0,
                top: 40,
                child: Image.asset(AppImages.person, width: 208, height: 300)),
            Positioned(
                bottom: size.height * 0.05,
                left: 0,
                right: 0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.logomini),
                    Padding(
                      padding: const EdgeInsets.only(left: 70, right: 70),
                      child: Text(
                        "Organize seus boletos em um só lugar",
                        style: AppTextStyles.titleHome,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(left: 40, right: 40, top: 40),
                        child: SocialLoginButton(
                          onTap: () {
                            controller.googleSignIn(context);
                          },
                        ),
                        )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
