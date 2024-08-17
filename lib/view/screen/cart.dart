import 'package:ecommerce_pro/controller/cart/Get_Cart.dart';
import 'package:ecommerce_pro/controller/cart/add_delete_cart_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';
import 'package:ecommerce_pro/view/widget/cart/custom_bottombar.dart';
import 'package:ecommerce_pro/view/widget/cart/custom_cart.dart';
import 'package:ecommerce_pro/view/widget/favourite/Custom_Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../controller/Favourite/state.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GetCartCubit>(
      create: (BuildContext context) => getIt<GetCartCubit>()
        ..getCartController()
        ..getQuantityController(),
      child: BlocBuilder<GetCartCubit, ResultState<CartModel>>(
        builder: (BuildContext context, ResultState<CartModel> state) {
          return state.when(idle: () {
            return const Center(child: CircularProgressIndicator());
          }, loading: () {
            return const Center(child: CircularProgressIndicator());
          }, success: (CartModel cartModel) {
            return BlocProvider<AddCartCubit>(
              create: (BuildContext context) => getIt<AddCartCubit>(),
              child: BlocBuilder<AddCartCubit, AddAndDeleteState>(
                builder: (BuildContext context, AddAndDeleteState state) {
                  return Scaffold(
                    appBar: AppBar(
                      actions: [
                        CustomAppBar(onPressed: () {
                          AddCartCubit.get(context).deleteAllCart();
                        }),
                      ],
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                    ),
                    bottomNavigationBar: const Custombottombar(),
                    body: const CustomCart(),
                  );
                },
              ),
            );
          }, error: (NetworkExceptions networkExceptions) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Cart is empty!! \n         Add items',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            );
          });
        },
      ),
    );
  }
}
