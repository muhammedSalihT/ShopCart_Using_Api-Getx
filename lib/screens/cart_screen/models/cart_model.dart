class CartModel {
    CartModel({
        this.allCart,
        this.status,
        this.massege,
    });

    List<AllCart>? allCart;
    bool? status;
    String? massege;

    factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        allCart: List<AllCart>.from(json["allCart"].map((x) => AllCart.fromJson(x))),
        status: json["status"],
        massege: json["massege"],
    );

    Map<String, dynamic> toJson() => {
        "allCart": List<dynamic>.from(allCart!.map((x) => x.toJson())),
        "status": status,
        "massege": massege,
    };
}

class AllCart {
    AllCart({
        this.id,
        this.cartitemId,
        this.userId,
        this.v,
    });

    String? id;
    CartitemId? cartitemId;
    String? userId;
    int? v;

    factory AllCart.fromJson(Map<String, dynamic> json) => AllCart(
        id: json["_id"],
        cartitemId: CartitemId.fromJson(json["cartitem_Id"]),
        userId: json["user_Id"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "cartitem_Id": cartitemId!.toJson(),
        "user_Id": userId,
        "__v": v,
    };
}

class CartitemId {
    CartitemId({
        this.images,
        this.coustemerRatimg,
        this.productDescription,
        this.deliveryCharge,
        this.id,
        this.categoryName,
        this.productName,
        this.productPrize,
        this.productType,
        this.offerPrize,
        this.productSubCategorie,
        this.quantity,
        this.v,
    });

    Images? images;
    double? coustemerRatimg;
    String? productDescription;
    int? deliveryCharge;
    String? id;
    String? categoryName;
    String? productName;
    int? productPrize;
    String? productType;
    int? offerPrize;
    String? productSubCategorie;
    int? quantity;
    int? v;

    factory CartitemId.fromJson(Map<String, dynamic> json) => CartitemId(
        images: Images.fromJson(json["images"]),
        coustemerRatimg: json["coustemerRatimg"].toDouble(),
        productDescription: json["productDescription"],
        deliveryCharge: json["deliveryCharge"],
        id: json["_id"],
        categoryName: json["categoryName"],
        productName: json["productName"],
        productPrize: json["productPrize"],
        productType: json["productType"],
        offerPrize: json["offerPrize"],
        productSubCategorie: json["productSubCategorie"],
        quantity: json["quantity"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "images": images!.toJson(),
        "coustemerRatimg": coustemerRatimg,
        "productDescription": productDescription,
        "deliveryCharge": deliveryCharge,
        "_id": id,
        "categoryName": categoryName,
        "productName": productName,
        "productPrize": productPrize,
        "productType": productType,
        "offerPrize": offerPrize,
        "productSubCategorie": productSubCategorie,
        "quantity": quantity,
        "__v": v,
    };
}

class Images {
    Images({
        this.img1,
        this.img2,
        this.img3,
    });

    String? img1;
    String? img2;
    String? img3;

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        img1: json["img1"],
        img2: json["img2"],
        img3: json["img3"],
    );

    Map<String, dynamic> toJson() => {
        "img1": img1,
        "img2": img2,
        "img3": img3,
    };
}
