import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

var database;
void initialize() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  database = openDatabase(
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

  // Create a Student and add it to the Student table
  var afonso = const Student(
    id: 202008014,
    name: 'Afonso da Silva Pinto',
    absenceNumber: 2,
  );

  var david = const Student(
    id: 202006302,
    name: 'David dos Santos Ferreira',
    absenceNumber: 1,
  );

  var joao = const Student(
    id: 201905892,
    name: 'João Miguel Ferreira de Araújo Pinto Correia',
    absenceNumber: 1,
  );

  var ines = const Student(
    id: 202005545,
    name: 'Linda Inês de Pina Marques Rodrigues',
    absenceNumber: 1,
  );

  var monica = const Student(
    id: 201905753,
    name: 'Mónica Moura Pereira',
    absenceNumber: 3,
  );

  var tiago = const Student(
    id: 201905653,
    name: 'Tiago Mairos',
    absenceNumber: 3,
  );

  var ana = const Student(
    id: 201905652,
    name: 'Ana dos Santos Lisboa',
    absenceNumber: 3,
  );

  var oliveira = const Student(
    id: 202009029,
    name: 'Ana Catarina da Silva Oliveira',
    absenceNumber: 0,
  );

  var pinheiro = const Student(
    id: 202006059,
    name: 'Diogo Pinheiro Almeida',
    absenceNumber: 1,
  );

  var castro = const Student(
    id: 202006770,
    name: 'Hugo Reis de Castro',
    absenceNumber: 3,
  );

  var amaral = const Student(
    id: 202006677,
    name: 'Isabel André Amaral',
    absenceNumber: 2,
  );

  var guarniero = const Student(
    id: 201603903,
    name: 'Marcelo Guarniero Apolinário',
    absenceNumber: 2,
  );

  var lessa = const Student(
    id: 201900194,
    name: 'Matias Lessa Vaz',
    absenceNumber: 1,
  );

  var milena = const Student(
    id: 202008862,
    name: 'Milena Luísa Pereira Gouveia',
    absenceNumber: 3,
  );

  var manuel = const Student(
    id: 201704976,
    name: 'Tomás Manuel de Moura Duarte Agante Martins',
    absenceNumber: 2,
  );

  var henriques = const Student(
    id: 202006141,
    name: 'Jose Manuel Henriques Valente Marques de Sousa',
    absenceNumber: 3,
  );

  var braga = const Student(
    id: 201907095,
    name: 'Nuno Miguel Braga Ramos Antunes',
    absenceNumber: 1,
  );

  await insertStudent(afonso);
  await insertStudent(david);
  await insertStudent(joao);
  await insertStudent(ines);
  await insertStudent(monica);
  await insertStudent(ana);
  await insertStudent(tiago);
  await insertStudent(oliveira);
  await insertStudent(pinheiro);
  await insertStudent(castro);
  await insertStudent(amaral);
  await insertStudent(guarniero);
  await insertStudent(lessa);
  await insertStudent(milena);
  await insertStudent(manuel);
  await insertStudent(henriques);
  await insertStudent(braga);
}

// Define a function that inserts student into the database
Future<void> insertStudent(Student student) async {
  // Get a reference to the database.
  final db = await database;

  // Insert the Student into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same student is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'student',
    student.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

// A method that retrieves all the students from the student table.
Future<List<Student>> students() async {
  // Get a reference to the database.
  final db = await database;

  // Query the table for all The Students.
  final List<Map<String, dynamic>> maps = await db.query('student');

  // Convert the List<Map<String, dynamic> into a List<Student>.
  List<Student> list =  List.generate(maps.length, (i) {
    return Student(
      id: maps[i]['id'],
      name: maps[i]['name'],
      absenceNumber: maps[i]['absenceNumber'],
    );
  });
  list.sort((a, b) {
    return a.name.toString().toLowerCase().compareTo(b.name.toString().toLowerCase());
  });
  return list;
}

Future<void> updateStudent(Student student) async {
  // Get a reference to the database.
  final db = await database;

  // Update the given Student.
  await db.update(
    'student',
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
    'student',
    // Use a `where` clause to delete a specific student.
    where: 'id = ?',
    // Pass the Student's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
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