class Donor {
  int? id;
  late String name;
  late String age;
  late String phone;
  late String email;
  late String bloodgroup;

  Donor(
      {required this.name,
      required this.age,
      required this.phone,
      required this.email,
      required this.bloodgroup,
      required id});
  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "age": age,
      "phone": phone,
      "email": email,
      "bloodgroup": bloodgroup,
    };
  }
}
