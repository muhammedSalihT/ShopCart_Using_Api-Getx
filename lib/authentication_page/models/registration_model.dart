class Welcome {
    Welcome({
        required this.userMail,
        required this.userPassword,
    });

    String userMail;
    String userPassword;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        userMail: json["user_mail"],
        userPassword: json["user_password"],
    );

    Map<String, dynamic> toJson() => {
        "user_mail": userMail,
        "user_password": userPassword,
    };
}