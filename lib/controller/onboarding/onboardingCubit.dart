import 'package:ecommerce_pro/data/DataSource/static/static.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:ecommerce_pro/view/screen/auth/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'onboardingState.dart';

class onBoardingCubit extends Cubit<onBoardingState> {
  onBoardingCubit(this.pageController) : super(initalstate());
  static onBoardingCubit get(context) => BlocProvider.of(context);

  final PageController pageController;
  int currentIndex = 0;

  next(BuildContext context) {
    currentIndex++;
    pageController.animateToPage(currentIndex,
        duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    if (currentIndex == OnBoardingList.length) {
      sharedPreferences!.setString('onboarding', '1');
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    }
    emit(nextbutton());
  }

  onPageChanged(int index) {
    currentIndex = index;
    emit(pageChangedSucess());
  }

  void Skip(BuildContext context) {
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context) => Login()), (route) => false);
  }
}
