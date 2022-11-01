import 'dart:convert';

AddToCartModel addToCartModelFromJson(String str) => AddToCartModel.fromJson(json.decode(str));

String addToCartModelToJson(AddToCartModel data) => json.encode(data.toJson());

class AddToCartModel {
    AddToCartModel({
        this.savedCart,
        this.status,
        this.msg,
    });

    SavedCart? savedCart;
    bool? status;
    String? msg;

    factory AddToCartModel.fromJson(Map<String, dynamic> json) => AddToCartModel(
        savedCart: SavedCart.fromJson(json["savedCart"]),
        status: json["status"],
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "savedCart": savedCart!.toJson(),
        "status": status,
        "msg": msg,
    };
}

class SavedCart {
    SavedCart({
        this.cartitemId,
        this.userId,
        this.id,
        this.v,
    });

    String? cartitemId;
    String? userId;
    String? id;
    int? v;

    factory SavedCart.fromJson(Map<String, dynamic> json) => SavedCart(
        cartitemId: json["cartitem_Id"],
        userId: json["user_Id"],
        id: json["_id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "cartitem_Id": cartitemId,
        "user_Id": userId,
        "_id": id,
        "__v": v,
    };
}
