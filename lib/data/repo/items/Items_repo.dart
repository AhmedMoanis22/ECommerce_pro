import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/ItemsModel.dart';

class ItemsRepo {
final ApiServices apiServices;

  ItemsRepo({required this.apiServices});

  Future<ApiResult<ItemsModel>> itemsRepostry({
    required Map<String, dynamic> dataa,
  }) async {
    try {
      var response = await apiServices.postData(urll: getItems, data: dataa);
   

      return await ApiResult.success(ItemsModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
