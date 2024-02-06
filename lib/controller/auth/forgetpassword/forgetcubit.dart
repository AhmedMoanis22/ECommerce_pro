import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/data/repo/auth/Signin/forgetpassword.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/verifyCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPassswordCubit extends Cubit<ResultState<UserModel>> {
  ForgetPassswordCubit(this.forgetPasswordRepo) : super(const Idle());

  static ForgetPassswordCubit get(context) => BlocProvider.of(context);

  final ForgetPasswordRepo forgetPasswordRepo;

  void NavigateCheck(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyCode(
                  isforgetpass: false,
                )),
        (route) => false);
  }

  void forgetPassword({
    required String email,
  }) async {
    var data = await forgetPasswordRepo.forgetpassword(data: {
      'email': email,
    });
    data.when(success: (UserModel authintcationModel) {
      emit(ResultState.success(authintcationModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
