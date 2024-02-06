import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/cart_model.dart';

class CartRepo {
final ApiServices apiServices;

  CartRepo({required this.apiServices});

  Future<ApiResult<CartModel>> addToCart({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response = await apiServices.postData(urll: addcart, data: dataa);
      print(response.data);

      return ApiResult.success(CartModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<CartModel>> getcart() async {
    try {
      var response = await apiServices.getData(urll: getCart);
      print(response.data);

      return ApiResult.success(CartModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<CartModel>> deleteCartRepo() async {
    try {
      var response = await apiServices.deleteData(urll: deleteAllCart);
      print(response.data);

      return ApiResult.success(CartModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<CartModel>> deleteQuantityRepo({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response =
          await apiServices.deleteData(urll: deleteQuantity, data: dataa);
      print(response.data);

      return ApiResult.success(CartModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

  Future<ApiResult<CartModel>> deleteItemCartRepo({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response =
          await apiServices.deleteData(urll: deleteItemCart, data: dataa);
      print(response.data);

      return ApiResult.success(CartModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
