import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/auth/data/model/request/rest_password_request.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/otp_verfication.dart';
import 'package:bokkia/features/auth/presentation/widget/password_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class NewPassword extends StatelessWidget {
  const NewPassword({super.key, this.email, this.otp});
  final String? email;
  final int? otp;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController password = TextEditingController();
    TextEditingController confirmPassword = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ButtonBack(
          onPressed: () {
            context.pushReplacement(OtpVerfication());
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
                  content: Text("Password Reset Successfully"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is AuthStateError) {
              Navigator.of(context).pop();
              showErrorToast(context, state.message);
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
                    "Create new password",
                    style: getHeadLineTextStyle(context),
                  ),
                  Gap(10),
                  Text(
                    "Your new password must be unique from those previously used.",
                    style: getBodyTextStyle(
                      context,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(32),
                  PasswordWidget(passwordController: password),
                  Gap(15),
                  PasswordWidget(passwordController: confirmPassword),
                  Gap(38),
                  CustomButton(
                    size: Size(double.infinity, 56),
                    text: Text(
                      "Reset Password",
                      style: getBodyTextStyle(
                        context,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.resetPassword(
                          RestPasswordRequest(
                            verifyCode: otp,
                            newPassword: password.text,
                            newPasswordConfirmation: confirmPassword.text,
                          ),
                        );
                      } else {
                        return "Enter valid password";
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
