import 'dart:convert';

Reviews reviewsFromJson(String str) => Reviews.fromJson(json.decode(str));
String reviewsToJson(Reviews data) => json.encode(data.toJson());

class Reviews {
  Reviews({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  Reviews.fromJson(dynamic json) {
    rating = json['rating'];
    comment = json['comment'];
    date = json['date'];
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }
  num? rating;
  String? comment;
  String? date;
  String? reviewerName;
  String? reviewerEmail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['rating'] = rating;
    map['comment'] = comment;
    map['date'] = date;
    map['reviewerName'] = reviewerName;
    map['reviewerEmail'] = reviewerEmail;
    return map;
  }
}
