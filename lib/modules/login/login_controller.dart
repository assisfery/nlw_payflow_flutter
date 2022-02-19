import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nlw_payflow_flutter/shared/auth/auth_controller.dart';
import 'package:nlw_payflow_flutter/shared/models/user_model.dart';

class LoginController {

  final authControler = AuthController();

  Future<void> googleSignIn(BuildContext context) async {

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
      ],
    );

    try {
      final response = await _googleSignIn.signIn();
      print(response);
      authControler.setUser(context, UserModel(name: response!.displayName!, photoUrl: response.photoUrl!));
    } catch (error) {
      print(error);
      authControler.setUser(context, null);
    }

  }

}
