import 'Products.dart';
import 'dart:convert';

Carts cartsFromJson(String str) => Carts.fromJson(json.decode(str));
String cartsToJson(Carts data) => json.encode(data.toJson());

class Carts {
  Carts({
    this.id,
    this.products,
    this.total,
    this.discountedTotal,
    this.userId,
    this.totalProducts,
    this.totalQuantity,
  });

  Carts.fromJson(dynamic json) {
    id = json['id'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
    total = json['total'];
    discountedTotal = json['discountedTotal'];
    userId = json['userId'];
    totalProducts = json['totalProducts'];
    totalQuantity = json['totalQuantity'];
  }
  num? id;
  List<Products>? products;
  num? total;
  num? discountedTotal;
  num? userId;
  num? totalProducts;
  num? totalQuantity;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (products != null) {
      map['products'] = products?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    map['discountedTotal'] = discountedTotal;
    map['userId'] = userId;
    map['totalProducts'] = totalProducts;
    map['totalQuantity'] = totalQuantity;
    return map;
  }
}
