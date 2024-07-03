import 'dart:async';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'donor.dart';

class DatabaseService {
  late Database _datebase;

  Future openDB() async {
    _datebase = await openDatabase(
        //external storage path/dbname is the actual path to join this join maethod of path  package is used
        join(await getDatabasesPath(), "donor.db"),
        version: 1,
        // ee version code il ini student.db ennu mattoru db create cheyyan ptttilla
        onCreate: (Database db, int version) async {
      await db.execute(
          "CREATE TABLE donortable(id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT,age TEXT,phone TEXT,email TEXT,bloodgroup TEXT)");
    });
  }

  Future<int> insertDonor(Donor donor) async {
    await openDB();
    //insersion success anenkil +ve int return varum illenkil -ve int return varum
    return await _datebase.insert('donortable', donor.toMap());
  }

  Future<List<Donor>> getDonorList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase.query('donortable');
    return List.generate(maps.length, (index) {
      return Donor(
        id: maps[index]['id'],
        name: maps[index]['name'],
        age: maps[index]['age'],
        phone: maps[index]['phone'],
        email: maps[index]['email'],
        bloodgroup: maps[index]['bloodgroup'],
      );
    });
  }

  Future<int> updateDonor(Donor donor) async {
    await openDB();
    return await _datebase.update('donortable', donor.toMap(),
        where: 'id=?', whereArgs: [donor.id]);
  }

  Future<void> deleteDonor(int? id) async {
    await openDB();
    await _datebase.delete("donortable", where: "id = ? ", whereArgs: [id]);
  }
}
