import 'dart:developer';
import 'package:ecommerce_pro/controller/auth/Login/LoginCubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/core/function/appExitalert.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:ecommerce_pro/view/widget/auth/Customtexttitleauth.dart';
import 'package:ecommerce_pro/view/widget/auth/LogoAppAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/email_and_password.dart';
import 'package:ecommerce_pro/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  const Login({super.key});





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildLoginbody(context),
    );
  }

  buildLoginbody(BuildContext context) {
    return WillPopScope(
        onWillPop: () => appexitalert(context),
        child: BlocProvider(
          create: (BuildContext context) => getIt<LoginCubit>(),
          child: BlocConsumer<LoginCubit, ResultState<UserModel>>(
            listener: (context, ResultState<UserModel> state) async {
              state.whenOrNull(success: (UserModel authintcationModel) {
                Fluttertoast.showToast(
                    msg: authintcationModel.msg!,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: const Color.fromARGB(255, 14, 85, 1),
                    textColor: Colors.white,
                    fontSize: 16.0);
                LoginCubit.get(context).navigateLogin(context);
                sharedPreferences!.setInt(
                    'User_id', LoginCubit.get(context).userInfo!.uId!);
                log(LoginCubit.get(context).userInfo!.uId!.toString());
              }, error: (NetworkExceptions networkExceptions) {
                Fluttertoast.showToast(
                    msg: NetworkExceptions.getErrorMessage(networkExceptions),
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 5,
                    backgroundColor: const Color.fromARGB(255, 85, 1, 1),
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            },
            builder: (context, ResultState<UserModel> state) {
              return state.maybeWhen(loading: () {
                return const Center(child: CircularProgressIndicator());
              }, orElse: () {
                return Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 30, vertical: 15),
                  child: ListView(
                    children: [
                      const LogoAppAuth(
                          image: ImagesAseets.logo, width: 100, height: 170),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextTitleAuth(
                          Title: "Welcome Back",
                          ColorLine: Colors.black,
                          textStyle: apptheme.textTheme.headline2!),
                      CustomTextTitleAuth(
                        Title:
                            'Sign In With Your Email And Password Or Continue With Social Media',
                        textStyle: apptheme.textTheme.bodyText1!,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const EmailAndPassword(),
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          LoginCubit.get(context)
                              .navigateForgetPassword(context);
                        },
                        child: Text('Forget Password',
                            textAlign: TextAlign.right,
                            style: apptheme.textTheme.bodyText1),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                     
                      const SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          LoginCubit.get(context).navigateSignup(context);
                        },
                        child: const TextSignUp(
                          textone: 'Don\'t have an account?',
                          texttwo: 'Sign up',
                        ),
                      ),
                    ],
                  ),
                );
              });
            },
          ),
        ));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appcolors.WhiteColor,
      title: Text(
        'Login',
        style:
            apptheme.textTheme.headline1!.copyWith(color: appcolors.greyColor),
      ),
      centerTitle: true,
    );
  }
}
