import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/constanse/route.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/data/repo/auth/Signin/Login.dart';

import 'package:ecommerce_pro/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<ResultState<UserModel>> {
  LoginCubit(this.loginRepo) : super(const Idle());

  static LoginCubit get(context) => BlocProvider.of(context);

  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  bool shown = true;
  final LoginRepo loginRepo;
  UserInfo? userInfo;

  void navigateLogin(context) {
    Navigator.of(context).pushNamed(AppRoute.Home);
  }

  void navigateForgetPassword(context) {
    Navigator.of(context).pushNamed(AppRoute.forgetPassword);
  }

  void navigateSignup(context) {
    Navigator.of(context).pushNamed(AppRoute.signUp);
  }

  void emitLoginState({
    required String email,
    required String password,
  }) async {
    //  emit(loandingSignInState());

    var data = await loginRepo.login(dataa: {
      'email': email,
      'password': password,
    });

    data.when(success: (UserModel userModel) {
      userInfo = userModel.field;

      emit(ResultState.success(userModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }

  void signout(BuildContext context) {
    sharedPreferences!.clear();
    Navigator.of(context).pushNamed(AppRoute.login);
  }
}
