import 'package:ldb/students.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  late Database fadildb;
  Future<void> openDB() async {
    fadildb = await openDatabase(
      join(await getDatabasesPath(), "student.db"),
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE studenttable(id INTEGER PRIMARY KEY AUTOINCREMENT,names TEXT,courses TEXT)");
      },
    );
  }

  Future<int> insertStudent(Student student) async {
    await openDB();
    return await fadildb.insert("studenttable", student.toMap());
  }

  Future<int> updateStudent(Student student) async {
    await openDB();
    return await fadildb.update(
      "studenttable",
      student.toMap(),
      where: "id=?",
      whereArgs: [student.id],
    );
  }

  Future<int> deleteStudent(Student student) async {
    await openDB();
    return await fadildb.delete(
      "studenttable",
      where: "id=?",
      whereArgs: [student.id],
    );
  }

  Future<List<Student>> getStudentList() async {
    await openDB();
    final List<Map<String, dynamic>> maps = await fadildb.query("studenttable");
    return List.generate(
      maps.length,
      (index) {
        return Student(
          id: maps[index]["id"],
          name: maps[index]["names"],
          course: maps[index]["courses"],
        );
      },
    );
  }
}
