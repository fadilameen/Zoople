import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));
String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    this.id,
    this.title,
    this.price,
    this.quantity,
    this.total,
    this.discountPercentage,
    this.discountedTotal,
    this.thumbnail,
  });

  Products.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    quantity = json['quantity'];
    total = json['total'];
    discountPercentage = json['discountPercentage'];
    discountedTotal = json['discountedTotal'];
    thumbnail = json['thumbnail'];
  }
  num? id;
  String? title;
  num? price;
  num? quantity;
  num? total;
  num? discountPercentage;
  num? discountedTotal;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['price'] = price;
    map['quantity'] = quantity;
    map['total'] = total;
    map['discountPercentage'] = discountPercentage;
    map['discountedTotal'] = discountedTotal;
    map['thumbnail'] = thumbnail;
    return map;
  }
}
