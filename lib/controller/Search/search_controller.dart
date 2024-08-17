import 'dart:developer';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';
import 'package:ecommerce_pro/data/repo/search/search_repo.dart';
import 'package:ecommerce_pro/main.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<ResultState<ItemsModel>> {
  SearchCubit(this.searchReopstry) : super(const Idle());

  static SearchCubit get(context) => BlocProvider.of(context);
  final SearchRepo searchReopstry;
  bool isSearch = false;
  List<Items> searchList = [];

  void checkSerach(val) {
    if (val == '') {
      isSearch = false;
    }
    emit(ResultState.success(ItemsModel()));
  }

  void getallItems({required String name}) async {
    emit(const ResultState.loading());
    var data = await searchReopstry.getSearch(dataa: {
      'userId': sharedPreferences!.getInt('User_id'),
      'search': name,
    });
    data.when(success: (ItemsModel itemsModel) {
      searchList = itemsModel.items!;
      isSearch = true;
      emit(ResultState.success(itemsModel));
    }, failure: (NetworkExceptions networkExceptions) {
      log(networkExceptions.toString());
      emit(ResultState.error(networkExceptions));
    });
  }
}
