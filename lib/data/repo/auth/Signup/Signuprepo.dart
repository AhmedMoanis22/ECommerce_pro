import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';

class SignUpRepo {
  final ApiServices apiServices;

  SignUpRepo({required this.apiServices});

  Future<ApiResult<UserModel>> SignUpPostData(
      {required Map<String, dynamic> dataa}) async {
    try {
      var response = await apiServices.postData(urll: signUpEndPoint, data: dataa);
      return ApiResult.success(UserModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
