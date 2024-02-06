import 'package:ecommerce_pro/controller/auth/VerifyCode/verifyCubit.dart';
import 'package:ecommerce_pro/controller/auth/resetpassword/resetpasswordcubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/Customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/di/dependency_injection.dart';

class VerifyCode extends StatelessWidget {
  VerifyCode({super.key, this.isforgetpass});
  final bool? isforgetpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildbody(context),
    );
  }

  buildbody(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<VerifyCodeCubit>(),
      child: BlocConsumer<VerifyCodeCubit, ResultState<UserModel>>(
          builder: (context, ResultState<UserModel> state) {
        return state.maybeWhen(loading: () {
          return const Center(child: CircularProgressIndicator());
        }, orElse: () {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: ListView(
              children: [
                CustomTextTitleAuth(
                    Title: "Check Code",
                    ColorLine: Colors.black,
                    textStyle: apptheme.textTheme.headline2!),
                const SizedBox(
                  height: 15,
                ),
                CustomTextTitleAuth(
                  Title: 'Enter the Verification code\n to complete sign up ',
                  textStyle: apptheme.textTheme.bodyText1!,
                ),
                const SizedBox(
                  height: 20,
                ),
                OtpTextField(
                  borderRadius: BorderRadius.circular(20),
                  numberOfFields: 5,
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {},
                  onSubmit: (String verificationCode) {
                    print(emailverify);
                    VerifyCodeCubit.get(context).verifyCode(
                        email: emailverify!, code: verificationCode);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButtomAuth(
                    title: 'Done',
                    buttoncolor: Colors.blue[900]!,
                    textcolor: appcolors.WhiteColor),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    ResetPasswordCubit.get(context)
                        .resendCode(email: emailverify!);
                  },
                  child: CustomButtomAuth(
                      title: 'Resend Code',
                      buttoncolor: appcolors.WhiteColor,
                      textcolor: Colors.blue[900]!),
                ),
              ],
            ),
          );
        });
      }, listener: (context, ResultState<UserModel> state) {
        state.whenOrNull(success: (UserModel authintcationModel) {
          print(isforgetpass);
          if (isforgetpass == true) {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.successSignUp, (route) => false);
          } else {
            Navigator.of(context).pushNamedAndRemoveUntil(
                AppRoute.resetPassword, (route) => false);
          }
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
              backgroundColor: const Color.fromARGB(255, 131, 11, 2),
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
        'Verification Code',
        style:
            apptheme.textTheme.headline1!.copyWith(color: appcolors.greyColor),
      ),
      centerTitle: true,
    );
  }
}
