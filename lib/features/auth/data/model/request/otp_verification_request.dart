class OtpVerificationRequest {
  String? email;
  int? verifyCode;

  OtpVerificationRequest({this.email, this.verifyCode});

  Map<String, dynamic> toJson() => {'email': email, 'verify_code': verifyCode};
}
