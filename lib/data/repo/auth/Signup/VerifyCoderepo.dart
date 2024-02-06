import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';

class VerifyCodeRepo {
  final ApiServices apiServices;

  VerifyCodeRepo({required this.apiServices});

  Future<ApiResult<UserModel>> VerifyCodeSignUp(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await apiServices.patchData(
        urll: verifyCodeSignUpEnfPoint,
        data: data,
      );
      return ApiResult.success(UserModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
}
