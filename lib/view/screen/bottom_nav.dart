import 'package:ecommerce_pro/controller/botomNav_controller/bottom_cubit.dart';
import 'package:ecommerce_pro/controller/botomNav_controller/bottom_state.dart';
import 'package:ecommerce_pro/view/screen/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
       create: (context) => BotomNavCubit(),
      child: BlocBuilder<BotomNavCubit, BotomNavState>(
        builder: (context, state) {
          return Scaffold(
            body: BotomNavCubit.get(context)
                .screens[BotomNavCubit.get(context).currentPage],
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.brown[400],
              
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Cart()));
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                children: [
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          BotomNavCubit.get(context).currentPage = 0;
                          BotomNavCubit.get(context).changeScreen(
                              BotomNavCubit.get(context).currentPage);
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.home,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          BotomNavCubit.get(context).currentPage = 1;
                          BotomNavCubit.get(context).changeScreen(
                              BotomNavCubit.get(context).currentPage);
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.favorite,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      MaterialButton(
                        onPressed: () {
                          BotomNavCubit.get(context).currentPage = 2;
                          BotomNavCubit.get(context).changeScreen(
                              BotomNavCubit.get(context).currentPage);
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.category_outlined,
                            ),
                          ],
                        ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          BotomNavCubit.get(context).currentPage = 3;
                          BotomNavCubit.get(context).changeScreen(
                              BotomNavCubit.get(context).currentPage);
                        },
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.person,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
