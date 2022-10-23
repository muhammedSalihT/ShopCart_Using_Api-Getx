class SubCategorieModel {
    SubCategorieModel({
        this.data,
        this.msg,
    });

    List<GetAllSubCategorie>? data;
    String? msg;

    factory SubCategorieModel.fromJson(Map<String, dynamic> json) => SubCategorieModel(
        data: List<GetAllSubCategorie>.from(json["data"].map((x) => GetAllSubCategorie.fromJson(x))),
        msg: json["msg"],
    );

}

class GetAllSubCategorie {
    GetAllSubCategorie({
        this.subImage,
        this.id,
        this.categoryName,
        this.subCategorieName,
        this.v,
    });

    SubImage? subImage;
    String? id;
    String? categoryName;
    String? subCategorieName;
    int? v;

    factory GetAllSubCategorie.fromJson(Map<String, dynamic> json) => GetAllSubCategorie(
        subImage: SubImage.fromJson(json["subImage"]),
        id: json["_id"],
        categoryName: json["categoryName"],
        subCategorieName: json["subCategorieName"],
        v: json["__v"],
    );
}

class SubImage {
    SubImage({
        this.data,
        this.contentType,
    });

    String? data;
    String? contentType;

    factory SubImage.fromJson(Map<String, dynamic> json) => SubImage(
        data: json["data"],
        contentType: json["contentType"],
    );

    Map<String, dynamic> toJson() => {
        "data": data,
        "contentType": contentType,
    };
}
