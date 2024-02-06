import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Favourite/Add_deleteItem.dart';
import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/controller/Home/itemscubit.dart';
import 'package:ecommerce_pro/controller/Search/search_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:ecommerce_pro/view/screen/items_details.dart';
import 'package:ecommerce_pro/view/widget/Home/CustomTextfield.dart';
import 'package:ecommerce_pro/view/widget/Search/Custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomItems extends StatelessWidget {
  const CustomItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchCubit>(
      create: (BuildContext context) => getIt<SearchCubit>(),
      child: BlocBuilder<SearchCubit, ResultState<ItemsModel>>(
        builder: (BuildContext context, state) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomTextField(
                title: 'search.....',
                prefixIcon: Icons.search,
              ),
              const SizedBox(
                height: 30,
              ),
              SearchCubit.get(context).isSearch == false
                  ? BlocProvider<AddAndDeleteFavouriteCubit>(
                    create: (BuildContext context)=>getIt<AddAndDeleteFavouriteCubit>(),
                    child: BlocConsumer<AddAndDeleteFavouriteCubit, AddAndDeleteState>(
                        builder: (BuildContext context, state) {
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            crossAxisCount: 2,
                            mainAxisSpacing: 10.0,
                            crossAxisSpacing: 10.0,
                            childAspectRatio: 1 / 1.5,
                            children: List.generate(
                              ItemsCubit.get(context).itemList!.length,
                              (index) {
                                return InkWell(
                                  onTap: () {
                                    indexDetails = index;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Itemsdetails()));
                                    sharedPreferences!.setInt(
                                        'itemId',
                                        ItemsCubit.get(context)
                                            .itemList![index]
                                            .itemId!);
                                  },
                                  child: Stack(
                                    children: [
                                      Container(
                                        width: 350,
                                        height: 350,
                                        decoration: BoxDecoration(
                                          color: Colors.grey[350],
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SizedBox(
                                                width: 200,
                                                height: 200,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  child: CachedNetworkImage(
                                                      imageUrl:
                                                          '${ImagesAseets.itemsimageServer}/${ItemsCubit.get(context).itemList![index].itemImg}'),
                                                ),
                                              ),
                                              Text(
                                                '${ItemsCubit.get(context).itemList![index].itemNameEn}',
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 5, 0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      '${ItemsCubit.get(context).itemList![index].priceAfterDiscount}  EGP',
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      onPressed: () {
                                                        if (ItemsCubit.get(
                                                                    context)
                                                                .itemList![index]
                                                                .favourite ==
                                                            1) {
                                                          AddAndDeleteFavouriteCubit.get(
                                                                  context)
                                                              .deleteitems(
                                                                  itemId: ItemsCubit
                                                                          .get(
                                                                              context)
                                                                      .itemList![
                                                                          index]
                                                                      .itemId!);
                                                        } else {
                                                          AddAndDeleteFavouriteCubit.get(
                                                                  context)
                                                              .addFavourite(
                                                                  itemId: ItemsCubit
                                                                          .get(
                                                                              context)
                                                                      .itemList![
                                                                          index]
                                                                      .itemId!);
                                                        }
                                                      },
                                                      icon: Icon(
                                                        ItemsCubit.get(context)
                                                                    .itemList![
                                                                        index]
                                                                    .favourite ==
                                                                1
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_border_outlined,
                                                        color: Colors.red[900],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      if (ItemsCubit.get(context)
                                              .itemList![index]
                                              .itemDiscount !=
                                          0)
                                        Image.asset(
                                          ImagesAseets.saleBanner,
                                          width: 80,
                                        ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          );
                        },
                        listener: (BuildContext context, state) {
                          if (state is SuccessAdd) {
                            ItemsCubit.get(context).getallItems(catId: indexx!);
                          }
                          if (state is SuccessDelete) {
                            ItemsCubit.get(context).getallItems(catId: indexx!);
                          }
                        },
                      ),
                  )
                  : const CustomSearch()
            ],
          );
        },
      ),
    );
  }
}
