import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nlw_payflow_flutter/modules/home/home_page.dart';
import 'package:nlw_payflow_flutter/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';

class AuthController
{
  var _isAuthenticated = false;
  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user)
  {
    if(user != null)
    {
      _user = user;
      _isAuthenticated = true;

      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home");
    }
    else
    {
      _isAuthenticated = false;
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();
    await instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();

    await Future.delayed(const Duration(seconds: 2));

    if(instance.containsKey("user"))
    {
      final user = instance.getString("user") as String;
      setUser(context, UserModel.fromJson(user));
    }
    else
    {
      setUser(context, null);
    }

    return;
  }

}