import 'dart:developer';

import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';
import 'package:ecommerce_pro/data/repo/cart/cart_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCartCubit extends Cubit<ResultState<CartModel>> {
  GetCartCubit(this.cartRepostry) : super(const Idle());
  static GetCartCubit get(context) => BlocProvider.of(context);
  final CartRepo cartRepostry;
  List<Items> cartitems = [];
  CartModel? cartList;
  List<int> quantity = [];

  void getCartController() async {
    emit(const ResultState.loading());
    var data = await cartRepostry.getcart();
    data.when(success: (CartModel cartModel) {
      cartList = cartModel;
      cartitems = cartModel.items!;
      emit(ResultState.success(cartModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
  void getQuantityController() async {
    var data = await cartRepostry.getcart();
    data.when(success: (CartModel cartModel) {
      cartList = cartModel;
      cartitems = cartModel.items!;
      log(cartitems[0].cost.toString());
      emit(ResultState.success(cartModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  // void quantityController({required int index}) async {
  //   emit(const ResultState.loading());
  //   var data = await cartRepostry.getQuantity();
  //   data.when(success: (CartModel cartModel) {
  //     quantity = cartModel.items![index].quantity;
  //     log('quantity'.toString());
  //     emit(ResultState.success(cartModel));
  //   }, failure: (NetworkExceptions networkExceptions) {
  //     emit(ResultState.error(networkExceptions));
  //   });
  // }
}
