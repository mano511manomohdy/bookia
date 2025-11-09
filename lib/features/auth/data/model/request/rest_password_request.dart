class RestPasswordRequest {
  int? verifyCode;
  String? newPassword;
  String? newPasswordConfirmation;

  RestPasswordRequest({
    this.verifyCode,
    this.newPassword,
    this.newPasswordConfirmation,
  });

  factory RestPasswordRequest.fromJson(Map<String, dynamic> json) {
    return RestPasswordRequest(
      verifyCode: json['verify_code'] as int?,
      newPassword: json['new_password'] as String?,
      newPasswordConfirmation: json['new_password_confirmation'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'verify_code': verifyCode,
    'new_password': newPassword,
    'new_password_confirmation': newPasswordConfirmation,
  };
}
