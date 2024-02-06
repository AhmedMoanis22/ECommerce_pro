import 'package:ecommerce_pro/core/colors/color.dart';
import 'package:ecommerce_pro/view/widget/auth/CustomButtomAuth.dart';
import 'package:ecommerce_pro/view/widget/auth/customtextformauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../controller/auth/Login/LoginCubit.dart';
import '../../../core/function/validinput.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;
  bool chechBoxIcon = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    passwordController;
    emailController;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formstate,
      child: Column(
        children: [
          CustomForTextAuth(
            valid: (val) {
              return validinput(val!, 5, 100, 'Email');
            },
            title: 'Email',
            description: 'Enter your Email',
            prefixIcon: Icons.email_outlined,
            controller: emailController,
          ),
          const SizedBox(
            height: 20,
          ),
          CustomForTextAuth(
            valid: (val) {
              return validinput(val!, 5, 30, 'Password');
            },
            title: 'Password',
            description: 'Enter your Password',
            prefixIcon: Icons.lock_outline_rounded,
            controller: passwordController,
            obsecure: isObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObscureText = !isObscureText;
                });
              },
              child: Icon(
                isObscureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    chechBoxIcon = !chechBoxIcon;
                  });
                },
                icon: Icon(
                  chechBoxIcon
                      ? Icons.check_box_rounded
                      : Icons.check_box_outline_blank,
                ),
              ),
              const Text(
                'Remember me',
              ),
              const Spacer(),
              Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                    ),
                  )),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: CustomButtomAuth(
                onPressed: () {
                  validateThenDoLogin(context);
                },
                title: 'Login',
                width: 400,
                buttoncolor: appcolors.puplecolor,
                textcolor: appcolors.WhiteColor),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    super.dispose();
  }

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formstate.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginState(
            password: passwordController.text,
            email: emailController.text,
          );
    }
  }
}
