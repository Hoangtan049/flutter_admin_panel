import '../utility/constants.dart';
class Category {
  String? sId;
  int? id;
  String? name;
  String? image;
  String? createdAt;
  String? updatedAt;
  Category({this.id, this.name, this.image, this.createdAt, this.updatedAt});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"] ?? "",
        image: json["image"] != "" && json["image"] != null
            ? MAIN_URL + "/uploads/images/" +json["image"]
            : "",
        createdAt: json["createdAt"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt,
      };
}