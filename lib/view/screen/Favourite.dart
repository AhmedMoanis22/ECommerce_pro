import 'package:ecommerce_pro/controller/Favourite/Add_deleteItem.dart';
import 'package:ecommerce_pro/controller/Favourite/GetFav.dart';
import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';

import 'package:ecommerce_pro/view/widget/favourite/Custom_Appbar.dart';
import 'package:ecommerce_pro/view/widget/favourite/custom_fav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddAndDeleteFavouriteCubit>(
      create: (BuildContext context) => getIt<AddAndDeleteFavouriteCubit>(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<AddAndDeleteFavouriteCubit, AddAndDeleteState>(
              builder: (BuildContext context, AddAndDeleteState state) {
                return CustomAppBar(onPressed: () {
                  AddAndDeleteFavouriteCubit.get(context).deleteAllFavourite();
                });
              },
            ),
          ],
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: BlocProvider<GetAllFavouriteCubit>(
          create: (BuildContext context) =>
              getIt<GetAllFavouriteCubit>()..getallFav(),
          child: BlocBuilder<GetAllFavouriteCubit, ResultState<ItemsModel>>(
            builder: (BuildContext context, state) {
              return state.when(idle: () {
                return const Center(child: CircularProgressIndicator());
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              }, success: (ItemsModel favouriteModel) {
                return const CustomFav();
              }, error: (NetworkExceptions networkExceptions) {
                return const Center(
                  child: Text(
                    'Favourite is empty!! \n         Add items',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
