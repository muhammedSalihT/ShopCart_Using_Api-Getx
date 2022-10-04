class SignUpResponseModel {
  SignUpResponseModel({
    this.status,
    this.resUser,
    this.msg,
  });

  bool? status;
  ResUser? resUser;
  String? msg;

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      SignUpResponseModel(
        status: json["status"],
        resUser:
            json["resUser"] == null ? null : ResUser.fromJson(json["resUser"]),
        msg: json["msg"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "resUser": resUser == null ? null : resUser!.toJson(),
        "msg": msg,
      };
}

class ResUser {
  ResUser({
    this.token,
    this.name,
    this.email,
    this.phoneNumber,
    this.password,
    this.type,
    this.id,
    this.v,
  });

  String? name;
  String? token;
  String? email;
  int? phoneNumber;
  String? password;
  String? type;
  String? id;
  int? v;

  factory ResUser.fromJson(Map<String, dynamic> json) => ResUser(
        token: json["token"],
        name: json["name"] ?? "",
        email: json["email"] ?? "",
        phoneNumber: json["phone_number"] ?? "",
        password: json["password"] ?? "",
        type: json["type"] ?? "",
        id: json["_id"] ?? "",
        v: json["__v"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "name": name,
        "email": email,
        "phone_number": phoneNumber,
        "password": password,
        "type": type,
        "_id": id,
        "__v": v,
      };
}
