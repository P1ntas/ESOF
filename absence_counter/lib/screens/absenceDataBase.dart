import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'absence_database.db'),
    // When the database is first created, create a table to store students.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE student(id INTEGER PRIMARY KEY, name TEXT, absenceNumber INTEGER)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  // Define a function that inserts student into the database
  Future<void> insertStudent(Student student) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Student into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same student is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'students',
      student.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the students from the student table.
  Future<List<Student>> students() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Students.
    final List<Map<String, dynamic>> maps = await db.query('students');

    // Convert the List<Map<String, dynamic> into a List<Student>.
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        absenceNumber: maps[i]['absenceNumber'],
      );
    });
  }

  Future<void> updateStudent(Student student) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Student.
    await db.update(
      'students',
      student.toMap(),
      // Ensure that the student has a matching id.
      where: 'id = ?',
      // Pass the Student's id as a whereArg to prevent SQL injection.
      whereArgs: [student.id],
    );
  }

  Future<void> deleteStudent(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Student from the database.
    await db.delete(
      'students',
      // Use a `where` clause to delete a specific student.
      where: 'id = ?',
      // Pass the Student's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  // Create a Student and add it to the Student table
  var fido = const Student(
    id: 0,
    name: 'Mónica',
    absenceNumber: 3,
  );

  await insertStudent(fido);

  // Now, use the method above to retrieve all the students.
  print(await students()); // Prints a list that include Fido.

  // Update Fido's absenceNumber and save it to the database.
  fido = Student(
    id: fido.id,
    name: fido.name,
    absenceNumber: fido.absenceNumber + 1,
  );
  await updateStudent(fido);

  // Print the updated results.
  print(await students()); // Prints Fido with age 42.

  // Delete Fido from the database.
  await deleteStudent(fido.id);

  // Print the list of students (empty).
  print(await students());
}

class Student {
  final int id;
  final String name;
  final int absenceNumber;

  const Student({
    required this.id,
    required this.name,
    required this.absenceNumber,
  });

  // Convert a Student into a Map. The keys must correspond to the names of the
  // columns in the database.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'absenceNumber': absenceNumber,
    };
  }

  // Implement toString to make it easier to see information about
  // each student when using the print statement.
  @override
  String toString() {
    return 'Student{id: $id, name: $name, absenceNumber: $absenceNumber}';
  }
}