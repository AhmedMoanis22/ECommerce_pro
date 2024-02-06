import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Search/search_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/view/widget/Home/Review_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, ResultState<ItemsModel>>(
      listener: (BuildContext context, ResultState<ItemsModel> state) {},
      builder: (BuildContext context, ResultState<ItemsModel> state) {
        return Flexible(
          fit: FlexFit.loose,
          child: ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Row(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: CachedNetworkImage(
                            imageUrl:
                                '${ImagesAseets.itemsimageServer}/${SearchCubit.get(context).searchList[index].itemImg}'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                '${SearchCubit.get(context).searchList[index].itemNameEn}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              '${SearchCubit.get(context).searchList[index].itemPrice}  EGP ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey.shade600),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '${SearchCubit.get(context).searchList[index].catNameEn}',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const ReviewCustom(review: 5.6),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: SearchCubit.get(context).searchList.length,
            
          ),
        );
      },
    );
  }
}
