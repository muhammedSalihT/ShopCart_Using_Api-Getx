class SubCategorieModel {
  SubCategorieModel({
    this.data,
    this.messege,
  });

  List<GetAllSubCategorie>? data;
  String? messege;

  factory SubCategorieModel.fromJson(Map<String, dynamic> json) =>
      SubCategorieModel(
        data: List<GetAllSubCategorie>.from(
            json["data"].map((x) => GetAllSubCategorie.fromJson(x))),
      );
}

class GetAllSubCategorie {
  GetAllSubCategorie({
    this.id,
    this.subCategorieName,
    this.subCategorieImage,
    this.v,
  });

  String? id;
  String? subCategorieName;
  String? subCategorieImage;
  int? v;

  factory GetAllSubCategorie.fromJson(Map<String, dynamic> json) =>
      GetAllSubCategorie(
        id: json["_id"],
        subCategorieName: json["subCategorieName"],
        subCategorieImage: json["subCategorieImage"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "subCategorieName": subCategorieName,
        "subCategorieImage": subCategorieImage,
        "__v": v,
      };
}
