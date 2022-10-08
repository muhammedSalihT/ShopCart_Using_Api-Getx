class GetTrendingModel {
  GetTrendingModel({
    this.trending,
    this.message,
  });

  List<Trending>? trending;
  String? message;

  factory GetTrendingModel.fromJson(Map<String, dynamic> json) =>
      GetTrendingModel(
        trending: List<Trending>.from(
            json["trending"].map((x) => Trending.fromJson(x))),
        message: json["message"],
      );
}

class Trending {
  Trending({
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

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
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
