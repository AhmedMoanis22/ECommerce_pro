import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';

class FavouriteRepo {
final ApiServices apiServices;

  FavouriteRepo({required this.apiServices});

  Future<ApiResult<ItemsModel>> postFavourite({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response = await apiServices.postData(urll: postfav, data: dataa);
      print(response.data);

      return ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ItemsModel>> getFavourite() async {
    try {
      var response = await apiServices.getData(urll: getfav);
      print(response.data);

      return ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ItemsModel>> deleteFavourite() async {
    try {
      var response = await apiServices.deleteData(urll: deletAllfav);
      print(response.data);

      return ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<ItemsModel>> deleteItems({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response = await apiServices.deleteData(urll: deletefav, data: dataa);
      print(response.data);
      return ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
