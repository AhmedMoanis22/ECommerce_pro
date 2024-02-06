import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/controller/Home/itemscubit.dart';
import 'package:ecommerce_pro/controller/cart/add_delete_cart_controller.dart';

import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomItemDetails extends StatelessWidget {
  const CustomItemDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.brown[100]!,
              Colors.brown[200]!,
              Colors.grey[100]!,
            ], begin: Alignment.topLeft),
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 80,
            ),
            child: CachedNetworkImage(
                imageUrl:
                    '${ImagesAseets.itemsimageServer}/${ItemsCubit.get(context).itemList![indexDetails!].itemImg}'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${ItemsCubit.get(context).itemList![indexDetails!].itemNameEn}',
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
              Text(
                '${ItemsCubit.get(context).itemList![indexDetails!].priceAfterDiscount}  EGP',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Description',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${ItemsCubit.get(context).itemList![indexDetails!].itemDescriptionEn}',
                style: const TextStyle(fontSize: 15),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                width: 600,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(20),
                  color: Colors.black,
                ),
                child: BlocProvider<AddCartCubit>(
                  create: (BuildContext context)=>getIt<AddCartCubit>(),
                  child: BlocBuilder<AddCartCubit, AddAndDeleteState>(
                    builder: (BuildContext context, AddAndDeleteState state) {
                      return MaterialButton(
                        onPressed: () {
                          AddCartCubit.get(context).addCart(
                              itemid:sharedPreferences!.getInt('itemId')!);
                          Fluttertoast.showToast(
                              msg: 'Add to cart successfully',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 5,
                              backgroundColor:
                                  const Color.fromARGB(255, 14, 85, 1),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        child: const Text(
                          'Add To Cart',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 600,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.9)),
                      const BoxShadow(color: Colors.black),
                      const BoxShadow(color: Colors.black)
                    ]),
                child: MaterialButton(
                  onPressed: () {},
                  child: const Text(
                    'Add To WishList',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
