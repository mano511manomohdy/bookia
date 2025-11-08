import 'dart:developer';

import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/core/widgets/social_account.dart';
import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/forget_password.dart';
import 'package:bokkia/features/auth/presentation/page/register.dart';
import 'package:bokkia/features/auth/presentation/widget/bottom_auth.dart';
import 'package:bokkia/features/auth/presentation/widget/email_widget.dart';
import 'package:bokkia/features/auth/presentation/widget/password_widget.dart';
import 'package:flutter/material.dart' hide BackButton;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false, title: ButtonBack()),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthStateLoading) {
                showLoadingDialog(context);
              } else if (state is AuthStateSuccess) {
                Navigator.of(context).pop();
                log("success");
              } else if (state is AuthStateError) {
                Navigator.of(context).pop();
                showErrorToast(context, state.message);
              }
            },
            builder: (context, state) {
              var cubit = context.read<AuthCubit>();
              return Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      "Welcome back! Glad to see you, Again!",
                      style: getHeadLineTextStyle(context),
                    ),
                    Gap(32),
                    EmailWidget(emailController: emailController),
                    Gap(15),
                    PasswordWidget(passwordController: passwordController),
                    Gap(13),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          child: Text(
                            "Forget Password ?",
                            style: getBodyTextStyle(context),
                          ),
                          onPressed: () {
                            context.pushReplacement(ForgetPassword());
                          },
                        ),
                      ],
                    ),
                    Gap(30),
                    CustomButton(
                      size: Size(double.infinity, 56),
                      text: Text(
                        "Login",
                        style: getBodyTextStyle(
                          context,
                          fontsize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      onpressed: () {
                        if (formKey.currentState!.validate()) {
                          cubit.login(
                            AuthRequest(
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        }
                      },
                      color: AppColors.primaryColor,
                    ),
                    Gap(44),
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.gray)),
                        Gap(10),
                        Text(
                          "Or Login with",
                          style: getSmallTextStyle(context),
                        ),
                        Gap(10),
                        Expanded(child: Divider(color: AppColors.gray)),
                      ],
                    ),
                    Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SocialAccount(image: "assets/icons/facebook_ic.svg"),
                        SocialAccount(image: "assets/icons/google_ic.svg"),
                        SocialAccount(image: "assets/icons/cib_apple.svg"),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAuth(
          text: "Register Now",
          onPressed: () {
            context.pushReplacement(Register());
          },
        ),
      ),
    );
  }
}
