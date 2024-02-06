import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';

import '../../../DataSource/web.dart';

class LoginRepo {
  final ApiServices apiServices;

  LoginRepo({required this.apiServices});
  Future<ApiResult<UserModel>> login(
      {required Map<String, dynamic> dataa}) async {
    try {
      var response = await apiServices.postData(urll: loginEndPoint, data: dataa);
      print(response.data);
      return ApiResult.success(UserModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
