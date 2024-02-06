import 'package:ecommerce_pro/controller/Home/itemscubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/di/dependency_injection.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/view/widget/items/custom_item_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Itemsdetails extends StatelessWidget {
  const Itemsdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<ItemsCubit>(
        create: (BuildContext context) =>
            getIt<ItemsCubit>()..getallItems(catId: indexx!),
        child: BlocBuilder<ItemsCubit, ResultState<ItemsModel>>(
          builder: (BuildContext context, state) {
            return state.when(idle: () {
              return const Center(child: CircularProgressIndicator());
            }, loading: () {
              return const Center(child: CircularProgressIndicator());
            }, success: (ItemsModel itemsModel) {
              return const SingleChildScrollView(
                child: CustomItemDetails(),
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
  }
}
