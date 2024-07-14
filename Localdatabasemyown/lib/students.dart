class Student {
  int? id;
  late String name;
  late String course;
  Student({this.id, required this.name, required this.course});

  Map<String, dynamic> toMap() {
    return {
      "names": name,
      "courses": course,
    };
  }
}
