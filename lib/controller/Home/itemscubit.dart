import 'dart:developer';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/data/repo/items/Items_repo.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemsCubit extends Cubit<ResultState<ItemsModel>> {
  ItemsCubit(this.itemsRepostry) : super(const Idle());

  static ItemsCubit get(context) => BlocProvider.of(context);
  final ItemsRepo itemsRepostry;
  List<Items>? itemList;

  void getallItems({required int catId}) async {
    const CircularProgressIndicator();
    emit(const ResultState.loading());
    var data = await itemsRepostry.itemsRepostry(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemCategory': catId
    });
    log(data.toString());
    data.when(success: (ItemsModel itemsModel) {
      itemList = itemsModel.items;
      emit(ResultState.success(itemsModel));
    }, failure: (NetworkExceptions networkExceptions) {
      log(networkExceptions.toString());
      emit(ResultState.error(networkExceptions));
    });
  }

  

 
}
