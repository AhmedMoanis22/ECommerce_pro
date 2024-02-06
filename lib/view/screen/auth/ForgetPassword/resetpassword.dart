import 'package:ecommerce_pro/controller/auth/resetpassword/resetpasswordcubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/core/function/validinput.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/Customtexttitleauth.dart';
import 'package:ecommerce_pro/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/di/dependency_injection.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});
  final passwordController = TextEditingController();
  final confirmPassworddController = TextEditingController();
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildbody(context),
    );
  }

  buildbody(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ResetPasswordCubit>(),
      child: BlocConsumer<ResetPasswordCubit, ResultState<UserModel>>(
          builder: (context, ResultState<UserModel> state) {
        return state.maybeWhen(loading: () {
          return const Center(child: CircularProgressIndicator());
        }, orElse: () {
          return Form(
            key: formstate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: ListView(
                children: [
                  CustomTextTitleAuth(
                      Title: "New Password",
                      ColorLine: Colors.black,
                      textStyle: Theme.of(context).textTheme.headline2!),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextTitleAuth(
                    Title:
                        'Set your new password so you can \n Login and acess again ',
                    textStyle: apptheme.textTheme.bodyText1!,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  CustomForTextAuth(
                    valid: (val) {
                      return validinput(val!, 5, 15, 'Password');
                    },
                    title: 'password',
                    description: 'create new password',
                    controller: passwordController,
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomForTextAuth(
                    valid: (val) {
                      return validinput(val!, 5, 15, 'Password');
                    },
                    title: 'password',
                    description: 'Confirm new password',
                    controller: confirmPassworddController,
                    prefixIcon: Icons.lock_outline_rounded,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      if (formstate.currentState!.validate()) {
                        print('valid');
                        if (passwordController.value !=
                            confirmPassworddController.value) {
                          Fluttertoast.showToast(
                              msg: 'Passwords did\'t match',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Color.fromARGB(255, 85, 1, 1),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        } else {
                          ResetPasswordCubit.get(context).resetpassword(
                              email: emailverify!,
                              password: passwordController.text);
                        }
                      } else {
                        print('not valid');
                      }
                    },
                    child: const CustomButtomAuth(
                        title: 'Confirm',
                        buttoncolor: appcolors.puplecolor,
                        textcolor: appcolors.WhiteColor),
                  ),
                ],
              ),
            ),
          );
        });
      }, listener: (context, ResultState<UserModel> state) {
        state.whenOrNull(success: (UserModel authintcationModel) {
          Fluttertoast.showToast(
              msg: authintcationModel.msg!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color.fromARGB(255, 12, 85, 1),
              textColor: Colors.white,
              fontSize: 16.0);

          ResetPasswordCubit.get(context).navigateResetPassword(context);
        }, error: (NetworkExceptions networkExceptions) {
          Fluttertoast.showToast(
              msg: NetworkExceptions.getErrorMessage(networkExceptions),
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color.fromARGB(255, 85, 15, 1),
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appcolors.WhiteColor,
      title: Text(
        'Reset Password',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: appcolors.greyColor),
      ),
      centerTitle: true,
    );
  }
}
