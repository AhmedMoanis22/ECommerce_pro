import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/data/repo/auth/Signin/resetpassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordCubit extends Cubit<ResultState<UserModel>> {
  ResetPasswordCubit(this.resetPasswordRepo) : super(const Idle());

  static ResetPasswordCubit get(context) => BlocProvider.of(context);

  TextEditingController? firstpassword;
  TextEditingController? secondpassword;
  final ResetPasswordRepo resetPasswordRepo;

  void resetpassword({
    required String email,
    required String password,
  }) async {
    var data = await resetPasswordRepo
        .resetpassword(data: {'email': email, 'password': password});
    data.when(success: (UserModel authintcationModel) {
      emit(ResultState.success(authintcationModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void resendCode({
    required String email,
  }) async {
    var data = await resetPasswordRepo
        .resendVerifyCode(data: {'email': email});
    data.when(success: (UserModel authintcationModel) {
      emit(ResultState.success(authintcationModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void navigateResetPassword(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
        context, AppRoute.successResetpassword, (route) => false);
  }
}
