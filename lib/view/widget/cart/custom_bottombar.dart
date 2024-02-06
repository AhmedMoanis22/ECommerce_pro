import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/controller/cart/Get_Cart.dart';
import 'package:ecommerce_pro/controller/cart/add_delete_cart_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Custombottombar extends StatelessWidget {
  const Custombottombar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddCartCubit, AddAndDeleteState>(
      builder: (BuildContext context, state) {
        if(state is SuccessDeleteAll)
        {
          return const SizedBox();
        }
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            BlocBuilder<GetCartCubit, ResultState<CartModel>>(
              builder: (BuildContext context, ResultState<CartModel> state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${GetCartCubit.get(context).cartList!.cartPrice}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Text(
                            ' EGP',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Deleivery Fee',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '10 EGP',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber[900],
                            ),
                          ),
                          Text(
                            '${GetCartCubit.get(context).cartList!.cartPrice! + 10.00} EGP',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.amber[900],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.deepOrange[700],
                ),
                child: MaterialButton(
                  onPressed: () {},
                  textColor: Colors.white,
                  child: const Text(
                    'Place Order',
                    style: TextStyle(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
