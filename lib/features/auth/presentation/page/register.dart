import 'dart:developer';

import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/core/widgets/social_account.dart';
import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/login.dart';
import 'package:bokkia/features/welcom/welcom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          padding: EdgeInsets.only(left: 2.5),
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.bordercolor, width: 2),
            color: AppColors.whiteColor,
          ),
          child: IconButton(
            onPressed: () {
              context.pushReplacement(Welcom());
            },
            icon: Icon(Icons.arrow_back_ios, color: AppColors.darkcolor),
          ),
        ),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthStateLoading) {
            showLoadingDialog(context);
          } else if (state is AuthStateSuccess) {
            Navigator.pop(context);
            log("success");
          } else if (state is AuthStateError) {
            Navigator.pop(context);
            showErrorToast(context, state.message);
          }
        },
        builder: (context, state) {
          var cubit = context.read<AuthCubit>();
          return Padding(
            padding: const EdgeInsets.all(22.0),
            child: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Text(
                      "Hello! Register to get started",
                      style: getHeadLineTextStyle(context),
                    ),
                    Gap(32),
                    TextFormField(
                      controller: cubit.nameController,
                      decoration: InputDecoration(
                        fillColor: AppColors.accentcolor,
                        filled: true,
                        hintText: "Username",
                        hintStyle: getSmallTextStyle(
                          context,
                          color: AppColors.gray,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your username";
                        } else if (value.toString().length < 6) {
                          return "Username must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    Gap(15),
                    TextFormField(
                      controller: cubit.emailController,
                      decoration: InputDecoration(
                        fillColor: AppColors.accentcolor,
                        filled: true,
                        hintText: "Email",
                        hintStyle: getSmallTextStyle(
                          context,
                          color: AppColors.gray,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }

                        final emailRegex = RegExp(
                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                        );
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }

                        return null;
                      },
                    ),

                    Gap(15),
                    TextFormField(
                      obscureText: true,
                      controller: cubit.passwordController,
                      decoration: InputDecoration(
                        fillColor: AppColors.accentcolor,
                        filled: true,
                        hintText: "Password",
                        hintStyle: getSmallTextStyle(
                          context,
                          color: AppColors.gray,
                        ),
                        suffixIconConstraints: BoxConstraints(minWidth: 30),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            "assets/icons/fluent_eye-20-filled.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),
                    Gap(15),
                    TextFormField(
                      obscureText: true,
                      controller: cubit.passwordConfirmationController,
                      decoration: InputDecoration(
                        fillColor: AppColors.accentcolor,
                        filled: true,
                        hintText: "Confirm Password",
                        hintStyle: getSmallTextStyle(
                          context,
                          color: AppColors.gray,
                        ),
                        suffixIconConstraints: BoxConstraints(minWidth: 30),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: SvgPicture.asset(
                            "assets/icons/fluent_eye-20-filled.svg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your password";
                        } else if (value.length < 6) {
                          return "Password must be at least 6 characters";
                        }
                        return null;
                      },
                    ),

                    Gap(30),

                    CustomButton(
                      size: Size(double.infinity, 56),
                      text: Text(
                        "Register",
                        style: getBodyTextStyle(
                          context,
                          fontsize: 14,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      onpressed: () {
                        if (cubit.formKey.currentState!.validate()) {
                          cubit.register(
                            AuthRequest(
                              name: cubit.nameController.text,
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                              passwordConfirmation:
                                  cubit.passwordConfirmationController.text,
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
                          "Or Register with",
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
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account", style: getBodyTextStyle(context)),
            TextButton(
              child: Text(
                "Login Now",
                style: getBodyTextStyle(context, color: AppColors.primaryColor),
              ),
              onPressed: () {
                context.pushReplacement(Login());
              },
            ),
          ],
        ),
      ),
    );
  }
}
