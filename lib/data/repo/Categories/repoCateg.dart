import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/CategoriesModel.dart';

class CategoriesReop {
final ApiServices apiServices;

  CategoriesReop({required this.apiServices});

  Future<ApiResult<CategModel>> categoriesReopstry() async {
    try {
      var response = await apiServices.getData(urll: getCategories);

      return ApiResult.success(CategModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
