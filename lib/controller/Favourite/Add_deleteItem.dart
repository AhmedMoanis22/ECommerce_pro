import 'dart:developer';

import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/data/repo/favourite/favourite.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAndDeleteFavouriteCubit extends Cubit<AddAndDeleteState> {
  AddAndDeleteFavouriteCubit(this.favouriteRepostry) : super(IntialAddAndDeleteState());

  static AddAndDeleteFavouriteCubit get(context) => BlocProvider.of(context);

  final FavouriteRepo favouriteRepostry;
  void addFavourite({required int itemId}) async {
    emit(LoadingAddAndDelete());
    var data = await favouriteRepostry.postFavourite(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemId': itemId,
    });
    data.when(success: (ItemsModel itemsModel) {
      log(itemsModel.msg.toString());
      emit(SuccessAdd(msg: itemsModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorAdd(msg: networkExceptions));
    });
  }

  void deleteitems({required int itemId}) async {
    emit(LoadingAddAndDelete());
    var data = await favouriteRepostry.deleteItems(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemId': itemId,
    });

    log(data.toString());
    data.when(success: (ItemsModel itemsModel) {
      log(itemsModel.msg!);
      emit(SuccessDelete(msg: itemsModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorDelete(error: networkExceptions));
    });
  }
  void deleteAllFavourite() async {
    emit(LoadingAddAndDelete());
    var data = await favouriteRepostry.deleteFavourite();
    log(data.toString());
    data.when(success: (ItemsModel favouriteModel) {
      log(favouriteModel.msg!);
      emit(SuccessDeleteAll(msg: favouriteModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorDelete(error: networkExceptions));
    });
  }


  
}
