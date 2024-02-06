import 'package:ecommerce_pro/core/class/api_result.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/data/DataSource/web.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';

class ResetPasswordRepo {
  final ApiServices apiServices;

  ResetPasswordRepo({required this.apiServices});

  Future<ApiResult<UserModel>> resetpassword(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await apiServices.patchData(
        urll: resetPasswordEndPoint,
        data: data,
      );
      return ApiResult.success(UserModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }
  
  Future<ApiResult<UserModel>> resendVerifyCode(
      {required Map<String, dynamic> data}) async {
    try {
      var response = await apiServices.patchData(
        urll: resendVerifyCodeEndPoint,
        data: data,
      );
      return ApiResult.success(UserModel.fromJson(response.data));
    } catch (error) {
      return ApiResult.failure(NetworkExceptions.getDioException(error));
    }
  }

}
