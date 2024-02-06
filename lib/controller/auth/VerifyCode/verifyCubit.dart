import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/data/repo/auth/Signup/VerifyCoderepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyCodeCubit extends Cubit<ResultState<UserModel>> {
  VerifyCodeCubit(this.verifyCodeRepo) : super(const Idle());

  static VerifyCodeCubit get(context) => BlocProvider.of(context);

  final VerifyCodeRepo verifyCodeRepo;

  void navigateRessetPassword(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoute.resetPassword, (route) => false);
  }

  void navigateSignUp(BuildContext context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoute.successSignUp, (route) => false);
  }

  void verifyCode({
    required String email,
    required String code,
  }) async {
    var data = await verifyCodeRepo.VerifyCodeSignUp(data: {
      'email': email,
      'verify_code': code,
    });
    data.when(success: (UserModel authintcationModel) {
      emit(ResultState.success(authintcationModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
  
}
