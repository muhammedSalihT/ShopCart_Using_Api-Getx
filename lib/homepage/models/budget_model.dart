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
        this.id,
        this.categoryName,
        this.productName,
        this.productPrize,
        this.productType,
        this.productSubCategorie,
        this.quantity,
        this.offerPrize,
        this.images,
        this.v,
    });

    String? id;
    String? categoryName;
    String? productName;
    int? productPrize;
    String? productType;
    String? productSubCategorie;
    int? quantity;
    int? offerPrize;
    String? images;
    int? v;

    factory Budget.fromJson(Map<String, dynamic> json) => Budget(
        id: json["_id"],
        categoryName: json["categoryName"],
        productName: json["productName"],
        productPrize: json["productPrize"],
        productType: json["productType"],
        productSubCategorie: json["productSubCategorie"],
        quantity: json["quantity"],
        offerPrize: json["offerPrize"],
        images: json["images"],
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "categoryName": categoryName,
        "productName": productName,
        "productPrize": productPrize,
        "productType": productType,
        "productSubCategorie": productSubCategorie,
        "quantity": quantity,
        "offerPrize": offerPrize,
        "images": images,
        "__v": v,
    };
}
