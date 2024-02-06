class CartModel {
  String? msg;
  List<Items>? items;
  int? cartCount;
  dynamic cartPrice;

  CartModel({this.items, this.cartCount, this.cartPrice, this.msg});

  CartModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    msg = json['msg'];
    cartCount = json['cartCount'];
    cartPrice = json['cartPrice'];
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
  dynamic priceAfterDiscount;
  int? quantity;
  dynamic cost;

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
      this.priceAfterDiscount,
      this.quantity,
      this.cost});

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
    priceAfterDiscount = json['price_after_discount'];
    quantity = json['quantity'];
    cost = json['cost'];
  }
}
