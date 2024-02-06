class ItemsModel {
  String? msg;
  List<Items>? items;

  ItemsModel({this.items,this.msg});

  ItemsModel.fromJson(Map<String, dynamic> json) {
     msg = json['msg'];
    if (json['items'] != null) {
      items = <Items>[];

      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }
}

class Items {
  int? itemId;
  String? itemNameEn;
  String? itemNameAr;
  String? itemDescriptionEn;
  String? itemDescriptionAr;
  String? itemImg;
  int? itemPrice;
  int? itemQuantity;
  int? itemDiscount;
  int? itemActive;
  String? itemCraeted;
  int? itemCategory;
  int? catId;
  String? catNameEn;
  String? catNameAr;
  String? catImg;
  String? catCreated;
  int? favourite;
  int? cart;
  dynamic priceAfterDiscount;


  Items(
      {this.itemId,
      this.itemNameEn,
      this.itemNameAr,
      this.itemDescriptionEn,
      this.itemDescriptionAr,
      this.itemImg,
      this.itemPrice,
      this.itemQuantity,
      this.itemDiscount,
      this.itemActive,
      this.itemCraeted,
      this.itemCategory,
      this.catId,
      this.catNameEn,
      this.catNameAr,
      this.catImg,
      this.catCreated,
      this.favourite,
      this.cart,
      this.priceAfterDiscount,
      
      });

  Items.fromJson(Map<String, dynamic> json) {
    itemId = json['item_id'];
    itemNameEn = json['item_name_en'];
    itemNameAr = json['item_name_ar'];
    itemDescriptionEn = json['item_description_en'];
    itemDescriptionAr = json['item_description_ar'];
    itemImg = json['item_img'];
    itemPrice = json['item_price'];
    itemQuantity = json['item_quantity'];
    itemDiscount = json['item_discount'];
    itemActive = json['item_active'];
    itemCraeted = json['item_craeted'];
    itemCategory = json['item_category'];
    catId = json['cat_id'];
    catNameEn = json['cat_name_en'];
    catNameAr = json['cat_name_ar'];
    catImg = json['cat_img'];
    catCreated = json['cat_created'];
    priceAfterDiscount = json['price_after_discount'];
    favourite = json['favourite'];
    cart = json['cart'];
  }
}
