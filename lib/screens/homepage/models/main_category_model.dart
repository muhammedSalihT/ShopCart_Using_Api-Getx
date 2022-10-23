class MainCategorieModel {
  MainCategorieModel({this.data, this.messege});

  List<GetAllCategories>? data;
  String? messege;

  factory MainCategorieModel.fromJson(Map<String, dynamic> json) =>
      MainCategorieModel(
        data: json["data"] == null
            ? []
            : List<GetAllCategories>.from(
                json["data"].map((x) => GetAllCategories.fromJson(x))),
      );
}

class GetAllCategories {
  GetAllCategories({
    this.id,
    this.mainProduct,
  });

  String? id;
  String? mainProduct;

  factory GetAllCategories.fromJson(Map<String, dynamic> json) =>
      GetAllCategories(
        id: json["_id"],
        mainProduct: json["mainProduct"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "mainProduct": mainProduct,
      };
}
