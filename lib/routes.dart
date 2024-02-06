import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/core/middleware/middleware.dart';
import 'package:ecommerce_pro/view/screen/address/details.dart';
import 'package:ecommerce_pro/view/screen/address/view.dart';
import 'package:ecommerce_pro/view/screen/bottom_nav.dart';
import 'package:ecommerce_pro/view/screen/HomeScreen.dart';
import 'package:ecommerce_pro/view/screen/Itmes.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/Success.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/forgetpassword.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/resetpassword.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/verifyCode.dart';
import 'package:ecommerce_pro/view/screen/auth/Login.dart';
import 'package:ecommerce_pro/view/screen/auth/Signup.dart';
import 'package:ecommerce_pro/view/screen/cart.dart';
import 'package:ecommerce_pro/view/screen/onboarding.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: AppRoute.login,
      page: () => Login(),
      transition: Transition.leftToRight),
  GetPage(
      name: AppRoute.signUp,
      page: () => SignUp(),
      transition: Transition.leftToRight),
  GetPage(
      name: AppRoute.forgetPassword,
      page: () => ForgetPassword(),
      transition: Transition.downToUp),
  GetPage(
      name: AppRoute.verfiyCode,
      page: () => VerifyCode(),
      transition: Transition.rightToLeft),
  GetPage(name: AppRoute.resetPassword, page: () => ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessVerification()),
  GetPage(name: AppRoute.HomeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  GetPage(name: AppRoute.ItemsScreen, page: () => const ItemsScreen()),
  GetPage(
      name: AppRoute.successSignUp, page: () => const SuccessVerification()),
  GetPage(name: AppRoute.Home, page: () => const Home()),
  GetPage(name: AppRoute.addressView, page: () => const AddressView()),
  GetPage(name: AppRoute.addressDetails, page: () => const AddressDetails()),
  GetPage(
      name: '/', page: () => const OnBoarding(), middlewares: [MyMiddleWare()]),
];
