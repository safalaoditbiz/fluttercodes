import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  List<Map<String, dynamic>> _employees = [];

  @override
  void initState() {
    super.initState();
    _loadEmployees();
  }

  void _loadEmployees() async {
    _employees = await DatabaseHelper2.instance.getAllEmployees();
    setState(() {
      _employees;
    });
  }

  void _addEmployee(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      String name = _nameController.text;
      int age = int.parse(_ageController.text);

      Map<String, dynamic> employee = {
        "name": name,
        "age": age,
      };
      try {
        await DatabaseHelper2.instance.insertEmployee(employee);
        _loadEmployees();
        _nameController.clear();
        _ageController.clear();
        //   Navigator.of(context).pop();
        // Close the dialog

      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee List'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _employees.length,
              itemBuilder: (context, index) {
                final employee = _employees[index];
                return ListTile(
                  title: Text(
                    employee[DatabaseHelper2.columnName],
                    style: TextStyle(color: Colors.purple),
                  ),
                  subtitle: Text('Age: ${employee[DatabaseHelper2.columnAge]}'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      _deleteEmployee(employee["_id"]);
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purple,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Add Employee'),
                content: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: InputDecoration(labelText: 'Name'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the employee name';
                          }
                          //  return null;
                        },
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _ageController,
                        decoration: InputDecoration(labelText: 'Age'),
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the employee age';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid age';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.purple,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      _addEmployee(context);
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _deleteEmployee(int id) async {
    await DatabaseHelper2.instance.deleteEmployee(id);
    _loadEmployees();
  }
}

class DatabaseHelper2 {
  static final _databaseName = 'my_database2.db';
  static final _databaseVersion = 2;

  static final table = 'employees';

  static final columnId = '_id';
  static final columnName = 'name';
  static final columnAge = 'age';

  // Singleton instance
  DatabaseHelper2._privateConstructor();
  static final DatabaseHelper2 instance = DatabaseHelper2._privateConstructor();

  // Database object
  static Database? _database;
  final _databaseCompleter = Completer<Database>();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _databaseCompleter.future;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    print('Database path: $path');

    final database = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
    _databaseCompleter.complete(database);
    return database;
  }

  Future<void> _onCreate(Database db, int version) async {
    try {
      await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
        $columnName TEXT NOT NULL,
        $columnAge INTEGER NOT NULL
      )
    ''');
    } catch (e) {
      print('Error creating table: $e');
    }
  }

  Future<int> insertEmployee(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> getAllEmployees() async {
    Database db = await instance.database;

    return await db.query(table);
  }

  Future<int> updateEmployee(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> deleteEmployee(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
