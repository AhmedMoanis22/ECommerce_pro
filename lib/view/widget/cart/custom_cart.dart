import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/controller/cart/Get_Cart.dart';
import 'package:ecommerce_pro/controller/cart/add_delete_cart_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCart extends StatelessWidget {
  const CustomCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddCartCubit, AddAndDeleteState>(
      builder: (BuildContext context, AddAndDeleteState state) {
        if (state is SuccessDeleteAll) {
          return const Center(
            child: Text(
              'Cart is empty!! \n         Add items',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          );
        }
        return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (BuildContext context, index) {
              return BlocBuilder<GetCartCubit, ResultState<CartModel>>(
                builder: (BuildContext context, ResultState<CartModel> state) {
                  if (state is SuccessDeleteQuantity) {
                    GetCartCubit.get(context).getCartController();
                  }
                  return Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        '${ImagesAseets.itemsimageServer}/${GetCartCubit.get(context).cartitems[index].itemImg}'),
                              ),
                              Expanded(
                                flex: 2,
                                child: ListTile(
                                  title: Text(
                                    '${GetCartCubit.get(context).cartitems[index].itemNameEn}',
                                    maxLines: 2,
                                  ),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                          '${GetCartCubit.get(context).cartitems[index].priceAfterDiscount} EGP'),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          AddCartCubit.get(context)
                                              .deleteItemsQuantity(
                                                  itemid:
                                                      GetCartCubit.get(context)
                                                          .cartitems[index]
                                                          .itemId!);
                                        },
                                        icon: const Icon(
                                            Icons.delete_outline_outlined),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          AddCartCubit.get(context).addCart(
                                              itemid: GetCartCubit.get(context)
                                                  .cartitems[index]
                                                  .itemId!);
                                        },
                                        icon: const Icon(Icons.add)),
                                    Text(
                                        '${GetCartCubit.get(context).cartitems[index].quantity}'),
                                    IconButton(
                                        onPressed: () {
                                          AddCartCubit.get(context)
                                              .deleteCartItem(
                                                  itemid:
                                                      GetCartCubit.get(context)
                                                          .cartitems[index]
                                                          .itemId!);
                                        },
                                        icon: const Icon(Icons.remove)),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            itemCount: GetCartCubit.get(context).cartitems.length);
      },
      listener: (BuildContext context, AddAndDeleteState state) {
        if (state is SuccessDeleteQuantity) {
          GetCartCubit.get(context).getCartController();
        }
        if (state is SuccessAdd) {
          GetCartCubit.get(context).getQuantityController();
        }
        if (state is SuccessDelete) {
          GetCartCubit.get(context).getQuantityController();
        }
      },
    );
  }
}
