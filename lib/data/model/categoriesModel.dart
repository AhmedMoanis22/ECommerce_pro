class CategModel {
  List<Categories>? categories;

  CategModel({this.categories});

  CategModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
  }
}

class Categories {
  int? catId;
  String? catNameEn;
  String? catNameAr;
  String? catImg;
  String? catCreated;

  Categories(
      {this.catId,
      this.catNameEn,
      this.catNameAr,
      this.catImg,
      this.catCreated});

  Categories.fromJson(Map<String, dynamic> json) {
    catId = json['cat_id'];
    catNameEn = json['cat_name_en'];
    catNameAr = json['cat_name_ar'];
    catImg = json['cat_img'];
    catCreated = json['cat_created'];
  }
}
