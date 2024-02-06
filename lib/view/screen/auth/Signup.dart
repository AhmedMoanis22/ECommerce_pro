import 'package:ecommerce_pro/controller/auth/SignUp/SignupCubit.dart';
import 'package:ecommerce_pro/controller/resul_state/result_state.dart';
import 'package:ecommerce_pro/core/class/network_exceptions.dart';
import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/core/constanse/End_Points.dart';
import 'package:ecommerce_pro/core/constanse/apptheme.dart';
import 'package:ecommerce_pro/core/function/validinput.dart';
import 'package:ecommerce_pro/data/model/user_model.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/Customtexttitleauth.dart';
import 'package:ecommerce_pro/view/widget/auth/customtextformauth.dart';
import 'package:ecommerce_pro/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../core/di/dependency_injection.dart';

class SignUp extends StatelessWidget {
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();

  final namecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final phonecontroller = TextEditingController();

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildSignUpbody(context),
    );
  }

  buildSignUpbody(BuildContext context) {
    return Form(
      key: formstate,
      child: BlocProvider(
         create: (context) =>getIt< SignupCubit>(),
        child: BlocConsumer<SignupCubit, ResultState<UserModel>>(
            listener: (context, ResultState<UserModel> state) {
          state.whenOrNull(success: (UserModel authintcationModel) {
            Fluttertoast.showToast(
                msg: authintcationModel.msg!,
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: const Color.fromARGB(255, 12, 85, 1),
                textColor: Colors.white,
                fontSize: 16.0);
            SignupCubit.get(context).navigateSignin(context);
          }, error: (NetworkExceptions networkExceptions) {
            Fluttertoast.showToast(
                msg: NetworkExceptions.getErrorMessage(networkExceptions),
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 5,
                backgroundColor: const Color.fromARGB(255, 85, 15, 1),
                textColor: Colors.white,
                fontSize: 16.0);
          });
        }, builder: (context, ResultState<UserModel> state) {
          return state.maybeWhen(loading: () {
            return const Center(child: CircularProgressIndicator());
          }, orElse: () {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomTextTitleAuth(
                        Title: "Sign Up Account",
                        ColorLine: Colors.black,
                        textStyle: apptheme.textTheme.headline2!),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextTitleAuth(
                      Title:
                          'Complete your details or continue with social media',
                      textStyle: apptheme.textTheme.bodyText1!,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomForTextAuth(
                      valid: (val) {
                        return validinput(val!, 3, 20, 'username');
                      },
                      title: 'Username',
                      description: 'Enter your Username',
                      prefixIcon: Icons.person_2_outlined,
                      controller: namecontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomForTextAuth(
                      valid: (val) {
                        return validinput(val!, 11, 15, 'Phone');
                      },
                      title: 'Phone',
                      description: 'Enter your Phone',
                      keyboard: TextInputType.phone,
                      prefixIcon: Icons.phone_in_talk_outlined,
                      controller: phonecontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomForTextAuth(
                      valid: (val) {
                        return validinput(val!, 5, 30, 'Email');
                      },
                      title: 'Email',
                      description: 'Enter your Email',
                      prefixIcon: Icons.email_outlined,
                      controller: emailcontroller,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomForTextAuth(
                      valid: (val) {
                        return validinput(val!, 5, 15, 'Password');
                      },
                      title: 'Password',
                      description: 'Enter your Password',
                      prefixIcon: Icons.lock_outline_rounded,
                      controller: passwordcontroller,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            if (formstate.currentState!.validate()) {
                              print('valid');
                              SignupCubit.get(context).emitSignUp(
                                  name: namecontroller.text,
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  phone: phonecontroller.text);
                              emailverify = emailcontroller.text;
                            } else {
                              print('not valid');
                            }
                          },
                          child: const CustomButtomAuth(
                            title: 'Sign up',
                            buttoncolor: appcolors.puplecolor, textcolor: appcolors.WhiteColor,
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            SignupCubit.get(context).loginNavigation(context);
                          },
                          child: const TextSignUp(
                            textone: 'already have an account?',
                            texttwo: 'Sign in',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          });
        }),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: appcolors.WhiteColor,
      title: Text(
        'Sign Up',
        style: Theme.of(context)
            .textTheme
            .headline1!
            .copyWith(color: appcolors.greyColor),
      ),
      centerTitle: true,
    );
  }
}
