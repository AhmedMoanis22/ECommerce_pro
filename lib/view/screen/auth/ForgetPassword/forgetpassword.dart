import 'dart:developer';
import 'package:ecommerce_pro/controller/auth/forgetpassword/forgetcubit.dart';
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

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final emailController = TextEditingController();
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
     create: (context) => getIt<ForgetPassswordCubit>(),
      child: BlocConsumer<ForgetPassswordCubit, ResultState<UserModel>>(
          builder: (context, ResultState<UserModel> state) {
        return state.maybeWhen(loading: () {
          return const Center(child: CircularProgressIndicator());
        }, orElse: () {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: ListView(
              children: [
                CustomTextTitleAuth(
                    Title: "Check Email",
                    ColorLine: Colors.black,
                    textStyle: apptheme.textTheme.headline2!),
                const SizedBox(
                  height: 15,
                ),
                CustomTextTitleAuth(
                  Title:
                      'Enter the email associated with your account and we\'ll send an email\n to reset your password',
                  textStyle: apptheme.textTheme.bodyText1!,
                ),
                const SizedBox(
                  height: 20,
                ),
                Form(
                  key: formstate,
                  child: CustomForTextAuth(
                    valid: (val) {
                      return validinput(val!, 5, 100, 'Email');
                    },
                    title: 'Email',
                    description: 'Enter your Email',
                    prefixIcon: Icons.email_outlined,
                    controller: emailController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    if (formstate.currentState!.validate()) {
                      log('valid');
                      ForgetPassswordCubit.get(context)
                          .forgetPassword(email: emailController.text);
                      emailverify = emailController.text;
                      ForgetPassswordCubit.get(context).NavigateCheck(context);
                    } else {
                      log('invalid');
                    }
                  },
                  child: const CustomButtomAuth(
                    title: 'Check',
                    buttoncolor: appcolors.puplecolor,
                    textcolor: appcolors.WhiteColor
                  ),
                ),
              ],
            ),
          );
        });
      }, listener: (context, ResultState<UserModel> state) {
        state.whenOrNull(success: (UserModel authintcationModel) {
          ForgetPassswordCubit.get(context).NavigateCheck(context);
          Fluttertoast.showToast(
              msg: authintcationModel.msg!,
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: const Color.fromARGB(255, 12, 85, 1),
              textColor: Colors.white,
              fontSize: 16.0);
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
      }),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appcolors.WhiteColor,
      title: Text(
        'Forget Password',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: appcolors.greyColor),
      ),
      centerTitle: true,
    );
  }
}
