import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleWare extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    if (sharedPreferences!.getString('onboarding') == '1') {
      return const RouteSettings(name: AppRoute.login);
    }
    return null;
  }

 
}
