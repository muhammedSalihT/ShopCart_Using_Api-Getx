class DeleteItem {
    DeleteItem({
        this.status,
        this.message,
    });

    bool? status;
    String? message;

    factory DeleteItem.fromJson(Map<String, dynamic> json) => DeleteItem(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
