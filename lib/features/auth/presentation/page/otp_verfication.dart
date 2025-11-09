import 'dart:developer';

import 'package:bokkia/core/extenstions/navigator.dart';
import 'package:bokkia/core/utils/app_colors.dart';
import 'package:bokkia/core/utils/text_style.dart';
import 'package:bokkia/core/widgets/back_button.dart';
import 'package:bokkia/core/widgets/custom_button.dart';
import 'package:bokkia/core/widgets/dialogs.dart';
import 'package:bokkia/features/auth/data/model/request/otp_verification_request.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bokkia/features/auth/presentation/cubit/auth_state.dart';
import 'package:bokkia/features/auth/presentation/page/forget_password.dart';
import 'package:bokkia/features/auth/presentation/page/new_password.dart';
import 'package:bokkia/features/auth/presentation/widget/bottom_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerfication extends StatelessWidget {
  const OtpVerfication({super.key, this.email});
  final String? email;

  @override
  Widget build(BuildContext context) {
    final formkey = GlobalKey<FormState>();
    TextEditingController otpController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ButtonBack(
          onPressed: () {
            context.pushReplacement(ForgetPassword());
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
                  content: Text("OTP Verified Successfully"),
                  backgroundColor: Colors.green,
                ),
              );
              context.pushTo(NewPassword());
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
                    "OTP Verification",
                    style: getHeadLineTextStyle(context),
                  ),
                  Gap(10),
                  Text(
                    "Enter the verification code we just sent on your email address.",
                    style: getBodyTextStyle(
                      context,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(32),
                  Center(
                    child: PinCodeTextField(
                      controller: otpController,
                      appContext: context,
                      length: 4,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.scale,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 60,
                        fieldWidth: 70,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeColor: AppColors.primaryColor,
                        inactiveColor: AppColors.primaryColor,
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      onCompleted: (v) {
                        log("Completed: $v");
                      },
                      onChanged: (value) {},
                    ),
                  ),

                  Gap(38),
                  CustomButton(
                    size: Size(double.infinity, 56),
                    text: Text(
                      "Verfiy",
                      style: getBodyTextStyle(
                        context,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    onpressed: () {
                      if (formkey.currentState!.validate()) {
                        cubit.verify(
                          OtpVerificationRequest(
                            email: email,
                            verifyCode: int.tryParse(otpController.text),
                          ),
                        );
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
          onPressed: () {
            if (otpController.text.length == 4 ||
                otpController.text.isNotEmpty) {
              context.read<AuthCubit>().resendVerifyCode();
            } else {
              showErrorToast(context, "Enter valid OTP");
            }
          },
          text: "ReSend",
          promptText: "Didn’t received code?",
        ),
      ),
    );
  }
}
