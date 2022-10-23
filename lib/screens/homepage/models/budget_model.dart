class GetBudgetModel {
    GetBudgetModel({
        this.budget,
        this.message,
    });

    List<Budget>? budget;
    String? message;

    factory GetBudgetModel.fromJson(Map<String, dynamic> json) => GetBudgetModel(
        budget: List<Budget>.from(json["budget"].map((x) => Budget.fromJson(x))),
        message: json["message"],
    );

}

class Budget {
    Budget({
        this.images,
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
    String? id;
    String? categoryName;
    String? productName;
    int? productPrize;
    String? productType;
    int? offerPrize;
    String? productSubCategorie;
    int? quantity;
    int? v;

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        images: Images.fromJson(json["images"]),
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
