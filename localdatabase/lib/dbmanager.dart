import 'dart:async';
import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';


import 'Student.dart';


class DatabaseService {
  late Database _datebase;

  Future openDB() async {
    _datebase = await openDatabase(
      //external storage path/dbname is the actual path to join this join maethod of path  package is used
        join(await getDatabasesPath(), "student.db"),
        version: 1,
        // ee version code il ini student.db ennu mattoru db create cheyyan ptttilla
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE studenttable(id INTEGER PRIMARY KEY AUTOINCREMENT,names TEXT,courses TEXT)");
        }
    );
  }

  Future<int> insertStudent(Student student)   async {
    await openDB();
    //insersion success anenkil +ve int return varum illenkil -ve int return varum
    return await _datebase.insert('studenttable', student.toMap());
  }

  Future<List<Student>> getStudentList()  async {
    await openDB();
    final List<Map<String, dynamic>> maps = await _datebase.query('studenttable');
    return List.generate(maps.length,
            (index) {
          return Student(
              id: maps[index]['id'],
              names: maps[index]['names'],
              courses: maps[index]['courses']);
        });
  }

  Future<int> updateStudent(Student student) async {
    await openDB();
    return await _datebase.update('studenttable', student.toMap(),
        where: 'id=?', whereArgs: [student.id]);
  }

  Future<void> deleteStudent(int? id) async {
    await openDB();
    await _datebase.delete("studenttable", where: "id = ? ", whereArgs: [id]);
  }
}