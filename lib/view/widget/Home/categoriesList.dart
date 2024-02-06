import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_pro/controller/Home/categoriesController..dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/view/screen/Itmes.dart';
import 'package:flutter/material.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ItemsScreen()));
      },
      child: SizedBox(
        height: 90,
        child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: CategoriesCubit.get(context).cat!.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  print(CategoriesCubit.get(context).cat![index].catId!);
                  indexx = CategoriesCubit.get(context).cat![index].catId!;
                  print('index=$indexx');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ItemsScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 70,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            "${ImagesAseets.categoriesimageServer}/${CategoriesCubit.get(context).cat![index].catImg}",
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
