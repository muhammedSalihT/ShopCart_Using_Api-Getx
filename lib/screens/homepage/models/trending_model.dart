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
    this.images,
    this.id,
    this.categoryName,
    this.productName,
    this.productPrize,
    this.offerPrize,
    this.productType,
    this.productSubCategorie,
    this.quantity,
    this.v,
  });

  Images? images;
  String? id;
  String? categoryName;
  String? productName;
  int? productPrize;
  int? offerPrize;
  String? productType;
  String? productSubCategorie;
  int? quantity;
  int? v;

  factory Trending.fromJson(Map<String, dynamic> json) => Trending(
        images: Images.fromJson(json["images"]),
        id: json["_id"],
        categoryName: json["categoryName"],
        productName: json["productName"],
        productPrize: json["productPrize"],
        offerPrize: json["offerPrize"],
        productType: json["productType"],
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
