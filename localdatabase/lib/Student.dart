class Student {
  int? id;
  late String names;
  late String courses;

  Student({this.id, required this.names, required this.courses});
  Map<String,dynamic>toMap(){
    return {
      "names":names,
      "courses":courses
    };
  }
}