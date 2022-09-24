class SignUpModel {
  SignUpModel({
    required this.userMail,
    required this.userPassword,
  });

  String userMail;
  String userPassword;

  Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
      };
}

class SignUpRespoModel {
  SignUpRespoModel({this.status, this.id, this.message});

  bool? status;
  String? id;
  String? message;

  factory SignUpRespoModel.fromJson(Map<String, dynamic> json) =>
      SignUpRespoModel(
        status: json["status"] ?? "",
        id: json["id"] ?? "",
      );
}
