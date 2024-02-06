import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/Customtexttitleauth.dart';
import 'package:ecommerce_pro/view/widget/auth/LogoAppAuth.dart';
import 'package:flutter/material.dart';

class SuccessVerification extends StatelessWidget {
  const SuccessVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        const SizedBox(
          height: 200,
        ),
        const LogoAppAuth(
          image: ImagesAseets.Success,
          width: 400,
          height: 200,
        ),
        const SizedBox(
          height: 20,
        ),
        CustomTextTitleAuth(
            Title: "Success",
            ColorLine: Colors.black,
            textStyle: apptheme.textTheme.headline2!),
        const SizedBox(
          height: 10,
        ),
        CustomTextTitleAuth(
          Title: 'Your indenify has been \n verified successfuly',
          textStyle: apptheme.textTheme.bodyText1!,
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, AppRoute.login, (route) => false);
            },
            child: const CustomButtomAuth(
              title: 'Sign in',
              buttoncolor: appcolors.greenColor,
              textcolor: appcolors.WhiteColor
            ),
          ),
        ),
      ]),
    );
  }
}
