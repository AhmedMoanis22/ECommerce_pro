import 'package:ecommerce_pro/view/widget/onBoarding/custombutton.dart';
import 'package:ecommerce_pro/view/widget/onBoarding/customdot.dart';
import 'package:ecommerce_pro/view/widget/onBoarding/customslider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../controller/onboarding/onboardingCubit.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(),
    );
  }

  PreferredSizeWidget? buildAppbar() => AppBar(actions: const [Text("data")]);

  Widget buildBody() {
    return BlocProvider(
     create: (context) => onBoardingCubit(PageController()),
      child: const Column(
        children: [
          Expanded(
            flex: 3,
            child: SafeArea(
              child: CustomSlider(),
            ),
          ),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  customdotOnBoarding(),
                  SizedBox(
                    height: 30,
                  ),
                  customButtonOnBoarding(),
                ],
              )),
        ],
      ),
    );
  }
}
