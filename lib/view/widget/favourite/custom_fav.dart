import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Favourite/Add_deleteItem.dart';
import 'package:ecommerce_pro/controller/Favourite/GetFav.dart';
import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/function/appExitalert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFav extends StatelessWidget {
  const CustomFav({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => appexitalert(context),
      child: BlocBuilder<AddAndDeleteFavouriteCubit, AddAndDeleteState>(
        builder: (BuildContext context, AddAndDeleteState state) {
          if (state is SuccessDeleteAll) {
            return const Center(
              child: Text(
                'Favourite is empty!! \n         Add items',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          }
          return ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: Stack(
                    children: [
                      Container(
                        width: 600,
                        height: 180,
                        decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadiusDirectional.circular(30),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            CachedNetworkImage(
                                width: 150,
                                imageUrl:
                                    '${ImagesAseets.itemsimageServer}/${GetAllFavouriteCubit.get(context).favouriteList[index].itemImg}'),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  width: 220,
                                  child: Text(
                                    '${GetAllFavouriteCubit.get(context).favouriteList[index].itemNameEn}',
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${GetAllFavouriteCubit.get(context).favouriteList[index].priceAfterDiscount}  EGP',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    BlocConsumer<AddAndDeleteFavouriteCubit,
                                        AddAndDeleteState>(
                                      builder: (BuildContext context,
                                          AddAndDeleteState state) {
                                        return IconButton(
                                          onPressed: () {
                                            AddAndDeleteFavouriteCubit.get(context)
                                                .deleteitems(
                                                    itemId: GetAllFavouriteCubit
                                                            .get(context)
                                                        .favouriteList[index]
                                                        .itemId!);
                                          },
                                          icon: const Icon(Icons.favorite),
                                          color: Colors.red[900],
                                        );
                                      },
                                      listener: (BuildContext context,
                                          AddAndDeleteState state) {
                                        if (state is SuccessDelete) {
                                          GetAllFavouriteCubit.get(context)
                                              .getallFav();
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Image.asset(
                        ImagesAseets.saleBanner,
                        width: 80,
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, index) {
                return const SizedBox(
                  height: 0,
                );
              },
              itemCount:
                  GetAllFavouriteCubit.get(context).favouriteList.length);
        },
      ),
    );
  }
}
