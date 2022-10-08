class SignUpResponseModel {
  SignUpResponseModel({
    this.status,
    this.token,
    this.resUser,
    this.msg,
  });

  bool? status;
  String? token;
  ResUser? resUser;
  String? msg;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        token: json["token"],
        status: json["status"],
        resUser:
            json["resUser"] == null ? null : ResUser.fromJson(json["resUser"]),
        msg: json["msg"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "status": status,
        "resUser": resUser == null ? null : resUser!.toJson(),
        "msg": msg,
      };
}

class ResUser {
  ResUser({
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.type,
    this.id,
    this.v,
  });

  String? name;
  String? email;
  int? phoneNumber;
  String? password;
  String? type;
  String? id;
  int? v;

  factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        password: json["password"] ?? "",
        type: json["type"] ?? "",
        id: json["_id"] ?? "",
        v: json["__v"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "type": type,
        "_id": id,
        "__v": v,
      };
}
