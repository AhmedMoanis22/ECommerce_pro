import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/view/screen/auth/ForgetPassword/verifyCode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/constanse/route.dart';
import '../../../data/repo/auth/Signup/Signuprepo.dart';

class SignupCubit extends Cubit<ResultState<UserModel>> {
  SignupCubit(this.signUpRepo) : super(const Idle());

  static SignupCubit get(context) => BlocProvider.of(context);
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var usernamecontroller = TextEditingController();
  var phonecontroller = TextEditingController();

  final SignUpRepo signUpRepo;

  void navigateSignin(BuildContext context) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context) => VerifyCode(
                  isforgetpass: true,
                )),
        (route) => false);
    emailcontroller.text = '';
    passwordcontroller.text = '';
    usernamecontroller.text = '';
    phonecontroller.text = '';
  }

  void loginNavigation(BuildContext context) {
    Navigator.pushNamed(context, AppRoute.login);
  }

  void emitSignUp({
    required String name,
    required String email,
    required String password,
    required String phone,
  }) async {
    var data = await signUpRepo.SignUpPostData(dataa: {
      'email': email,
      'password': password,
      'username': name,
      'phone': phone,
    });
    data.when(success: (UserModel authintcationModel) {
      emit(ResultState.success(authintcationModel));
    }, failure: (NetworkExceptions networkExceptions) {
      emit(ResultState.error(networkExceptions));
    });
  }
}
