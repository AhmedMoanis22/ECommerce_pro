import 'package:ecommerce_pro/controller/Home/categoriesController..dart';
import 'package:ecommerce_pro/controller/Search/search_controller.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/ImagesAssets.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/core/function/appExitalert.dart';
import 'package:ecommerce_pro/data/model/CategoriesModel.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';

import 'package:ecommerce_pro/view/widget/Home/CustomBanner.dart';
import 'package:ecommerce_pro/view/widget/Home/CustomTextfield.dart';
import 'package:ecommerce_pro/view/widget/Home/categoriesList.dart';
import 'package:ecommerce_pro/view/widget/Home/customTextTitle.dart';
import 'package:ecommerce_pro/view/widget/Search/Custom_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildappbar(),
      body: buildbody(),
    );
  }

  buildappbar() {
    return AppBar(
      backgroundColor: appcolors.WhiteColor,
      elevation: 0.0,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active_outlined))
      ],
    );
  }

  buildbody() => BlocProvider<SearchCubit>(
        create: (BuildContext context) => getIt<SearchCubit>(),
        child: BlocBuilder<SearchCubit, ResultState<ItemsModel>>(
          builder: (BuildContext context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextField(
                  title: 'search.....',
                  prefixIcon: Icons.search,
                ),
                SearchCubit.get(context).isSearch == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const CustomBanner(
                              title: 'Celaracne \n Sale',
                              imageName: ImagesAseets.shoesBanner),
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CustomTextTitle(title: 'Categories'),
                          ),
                          BlocProvider(
                            create: (context) =>
                                getIt<CategoriesCubit>()..getallCategories(),
                            child: BlocConsumer<CategoriesCubit,
                                ResultState<CategModel>>(
                              listener: (context, state) {},
                              builder:
                                  (context, ResultState<CategModel> state) {
                                return state.when(idle: () {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }, loading: () {
                                  return const Center(
                                      child: CircularProgressIndicator());
                                }, success: (CategModel categModel) {
                                  return WillPopScope(
                                    onWillPop: () => appexitalert(context),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 15.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CategoriesList(),
                                        ],
                                      ),
                                    ),
                                  );
                                }, error:
                                    (NetworkExceptions networkExceptions) {
                                  return Text(
                                    '$networkExceptions',
                                  );
                                });
                              },
                            ),
                          ),
                        ],
                      )
                    : const CustomSearch(),
              ],
            );
          },
        ),
      );
}
