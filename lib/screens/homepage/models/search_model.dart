class SearchListModel {
    SearchListModel({
        this.data,
        this.msg,
    });

    List<SearchList>? data;
    String? msg;

    factory SearchListModel.fromJson(Map<String, dynamic> json) => SearchListModel(
        data: List<SearchList>.from(json["data"].map((x) => SearchList.fromJson(x))),
        msg: json["msg"],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
        "msg": msg,
    };
}

class SearchList {
    SearchList({
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

    factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
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
