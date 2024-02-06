import 'package:ecommerce_pro/controller/Home/itemscubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/view/widget/items/Custom_items.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsScreen extends StatelessWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: buildbody(),
    );
  }

  buildbody() => SingleChildScrollView(
        child: BlocProvider<ItemsCubit>(
          create: (BuildContext context) =>
              getIt<ItemsCubit>()..getallItems(catId: indexx!),
          child: BlocBuilder<ItemsCubit, ResultState<ItemsModel>>(
            builder: (context, ResultState<ItemsModel> state) {
              return state.when(idle: () {
                return const Center(child: CircularProgressIndicator());
              }, loading: () {
                return const Center(child: CircularProgressIndicator());
              }, success: (ItemsModel itemsModel) {
                return const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
                  child: CustomItems(),
                );
              }, error: (NetworkExceptions networkExceptions) {
                return Text(
                  '$networkExceptions',
                );
              });
            },
          ),
        ),
      );

  buildAppbar() {
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
}
