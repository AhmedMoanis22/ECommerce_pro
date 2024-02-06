import 'package:ecommerce_pro/controller/onboarding/onboardingCubit.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerce_pro/core/colors/color.dart';

class customButtonOnBoarding extends StatelessWidget {
  const customButtonOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<onBoardingCubit, onBoardingState>(
          builder: (BuildContext context, state) {
            return SizedBox(
              width: 150,
              child: MaterialButton(
                onPressed: () {
                  onBoardingCubit.get(context).Skip(context);
                },
                textColor: appcolors.greyColor,
                child: const Text(
                  'Skip',
                ),
              ),
            );
          },
        ),
        const SizedBox(
          width: 100,
        ),
        Container(
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadiusDirectional.circular(40),
            color: appcolors.puplecolor,
          ),
          child: BlocBuilder<onBoardingCubit, onBoardingState>(
            builder: (context, state) {
              return MaterialButton(
                onPressed: () {
                  sharedPreferences!.setString('onboarding', '1');
                  onBoardingCubit.get(context).next(context);
                },
                textColor: Colors.white,
                child: const Text(
                  'Next',
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
