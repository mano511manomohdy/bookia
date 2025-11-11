import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/auth/data/model/request/auth_request.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/login.dart';
import 'package:bokkia/features/auth/presentation/page/otp_verfication.dart';
import 'package:bokkia/features/auth/presentation/widget/bottom_auth.dart';
import 'package:bokkia/features/auth/presentation/widget/email_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ButtonBack(
          onPressed: () {
            context.pushReplacement(Login());
          },
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthStateLoading) {
              showLoadingDialog(context);
            } else if (state is AuthStateSuccess) {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: Duration(seconds: 2),
                  content: Text("Password reset code sent to your email."),
                  backgroundColor: Colors.green,
                ),
              );
              context.pushReplacement(
                OtpVerfication(email: emailController.text),
              );
            } else if (state is AuthStateError) {
              Navigator.of(context).pop();
              showToast(context, state.message);
            }
          },
          builder: (context, state) {
            var cubit = context.read<AuthCubit>();
            return Form(
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password?",
                    style: getHeadLineTextStyle(context),
                  ),
                  Gap(10),
                  Text(
                    "Don't worry! It occurs. Please enter the email address linked with your account.",
                    style: getBodyTextStyle(
                      context,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(30),
                  EmailWidget(emailController: emailController),
                  Gap(38),
                  CustomButton(
                    size: Size(double.infinity, 56),
                    text: Text(
                      "SendCode",
                      style: getBodyTextStyle(
                        context,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.forgetPassword(
                          AuthRequest(email: emailController.text),
                        );
                      } else {
                        return "Enter valid email";
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: BottomAuth(
          text: "Login",
          onPressed: () {
            context.pushReplacement(Login());
          },
        ),
      ),
    );
  }
}
