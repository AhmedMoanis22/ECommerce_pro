import 'package:ecommerce_pro/controller/botomNav_controller/bottom_state.dart';
import 'package:ecommerce_pro/view/screen/Favourite.dart';
import 'package:ecommerce_pro/view/screen/HomeScreen.dart';
import 'package:ecommerce_pro/view/screen/setting.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BotomNavCubit extends Cubit<BotomNavState> {
  BotomNavCubit() : super(IntialState());

  static BotomNavCubit get(context) => BlocProvider.of(context);

  int currentPage = 0;


  List<Widget> screens = [
    const HomeScreen(),
    const FavouriteScreen(),
    const Column(
      children: [
        Text(
          'Categories',
        ),
      ],
    ),
    const Setting(),
  ];

  void changeScreen(int index) {
    currentPage = index;
    emit(SuccessBotomNav());
  }

  
 
}
