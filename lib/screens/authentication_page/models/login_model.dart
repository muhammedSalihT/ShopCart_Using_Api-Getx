class SignInResponseModel {
  SignInResponseModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory SignInResponseModel.fromJson(Map<String, dynamic> json) =>
      SignInResponseModel(
        status: json["status"],
        msg: json["msg"],
      );

      
}
