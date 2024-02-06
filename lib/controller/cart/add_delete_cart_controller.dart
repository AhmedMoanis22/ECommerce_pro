import 'dart:developer';

import 'package:ecommerce_pro/controller/Favourite/state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';
import 'package:ecommerce_pro/data/repo/cart/cart_repo.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCartCubit extends Cubit<AddAndDeleteState> {
  AddCartCubit(this.cartRepostry) : super(IntialAddAndDeleteState());

  static AddCartCubit get(context) => BlocProvider.of(context);
  final CartRepo cartRepostry;

  void addCart({required int itemid}) async {
    emit(LoadingAddAndDelete());
    var data = await cartRepostry.addToCart(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemId': itemid,
    });
    data.when(success: (CartModel cartModel) {
      log('cartttttt'.toString());
      log(cartModel.msg!);
      emit(SuccessAdd(msg: cartModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorAdd(msg: networkExceptions));
    });
  }

  void deleteAllCart() async {
    emit(LoadingAddAndDelete());
    var data = await cartRepostry.deleteCartRepo();
    data.when(success: (CartModel cartModel) {
      log('cartttttt'.toString());
      log(cartModel.msg!);
      emit(SuccessDeleteAll(msg: cartModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorDeleteAll(error: networkExceptions));
    });
  }

  void deleteItemsQuantity({required int itemid}) async {
    emit(LoadingAddAndDelete());
    var data = await cartRepostry.deleteQuantityRepo(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemId': itemid,
    });
    data.when(success: (CartModel cartModel) {
      log(cartModel.msg!);
      emit(SuccessDeleteQuantity(msg: cartModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorDeleteQuantity(error: networkExceptions));
    });
  }

  void deleteCartItem({required int itemid}) async {
    emit(LoadingAddAndDelete());
    var data = await cartRepostry.deleteItemCartRepo(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'itemId': itemid,
    });
    data.when(success: (CartModel cartModel) {
      log(cartModel.msg!);
      emit(SuccessDelete(msg: cartModel.msg!));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ErrorDelete(error: networkExceptions));
    });
  }
}
