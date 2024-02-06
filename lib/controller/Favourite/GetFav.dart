import 'dart:developer';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/data/repo/favourite/favourite.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetAllFavouriteCubit extends Cubit<ResultState<ItemsModel>> {
  GetAllFavouriteCubit(this.favouriteRepostry) : super(const Idle());

  static GetAllFavouriteCubit get(context) => BlocProvider.of(context);
  final FavouriteRepo favouriteRepostry;
  List<Items> favouriteList = [];
  IconData? favIcon;

  void getallFav() async {
    emit(const ResultState.loading());
    var data = await favouriteRepostry.getFavourite();
    log(data.toString());
    data.when(success: (ItemsModel favouriteModel) {
      favouriteList = favouriteModel.items!;

      log(favouriteList[0].itemNameEn.toString());

      print('favouriteeeeeee');

      emit(ResultState.success(favouriteModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void changeIconFav(int id)
  {

  }
}
