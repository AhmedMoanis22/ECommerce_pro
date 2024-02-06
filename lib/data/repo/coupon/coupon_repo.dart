import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';

class CouponReop {
final ApiServices apiServices;

  CouponReop({required this.apiServices});

  Future<ApiResult<ItemsModel>> getCoupon({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response = await apiServices.getData(urll: getouponEndPoint);
      print(response);

      return ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
