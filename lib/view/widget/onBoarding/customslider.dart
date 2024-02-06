import 'package:ecommerce_pro/controller/onboarding/onboardingCubit.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/data/DataSource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<onBoardingCubit, onBoardingState>(
      builder: (context, state) {
        return PageView.builder(
          controller: onBoardingCubit.get(context).pageController,
          onPageChanged: (value) {
            onBoardingCubit.get(context).onPageChanged(value);
          },
          itemCount: OnBoardingList.length,
          itemBuilder: (context, index) => Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 60.0,
              ),
              Image.asset(
                OnBoardingList[index].image!,
                width: 300,
                height: 300,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(OnBoardingList[index].title!,
                  style: apptheme.textTheme.headline1),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  OnBoardingList[index].body!,
                  textAlign: TextAlign.center,
                  style: apptheme.textTheme.bodyText1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
