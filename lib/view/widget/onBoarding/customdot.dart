import 'package:ecommerce_pro/controller/onboarding/onboardingCubit.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/data/DataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class customdotOnBoarding extends StatelessWidget {
  const customdotOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<onBoardingCubit, onBoardingState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              OnBoardingList.length,
              (index) => AnimatedContainer(
                margin: const EdgeInsets.only(right: 5),
                duration: const Duration(microseconds: 900),
                width: onBoardingCubit.get(context).currentIndex == index
                    ? 20
                    : 10,
                height: 10,
                decoration: BoxDecoration(
                  color: onBoardingCubit.get(context).currentIndex == index
                      ? appcolors.puplecolor
                      : const Color.fromARGB(255, 193, 189, 189),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
