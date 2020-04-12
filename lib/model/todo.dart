import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final Future<Database> database = getDatabasesPath().then((String path) {
  return openDatabase(
    join(path, 'todo_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE todo(id TEXT PRIMARY KEY, title TEXT, status BOOLEAN)",
      );
    },
    version: 1,
  );
});

Future<void> insertTodo(Todo todo) async {
  // Get a reference to the database.
  final Database db = await database;

  int x = await db.insert(
    'todo',
    todo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );

  print(x);
}

Future<void> updateTodo(Todo todo) async {
  final db = await database;

  await db.update(
    'todo',
    todo.toMap(),
    where: "id = ?",
    whereArgs: [todo.id],
  );
}

Future<void> deleteTodo(String id) async {
  final db = await database;

  await db.delete(
    'todo',
    where: "id = ?",
    whereArgs: [id],
  );
}

Future<List<Todo>> todos() async {
  final Database db = await database;

  final List<Map<String, dynamic>> maps = await db.query('todo');

  return List.generate(maps.length, (i) {
    return Todo(
      id: maps[i]['id'],
      title: maps[i]['title'],
      status: maps[i]['status'] == 1 ? true : false,
    );
  });
}

class Todo {
  final String id;
  final String title;
  bool status;

  Todo({
    this.id,
    this.title,
    this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'status': status ? 1 : 0,
    };
  }

  @override
  String toString() {
    return 'Todo{id: $id, title: $title, status: $status}';
  }
}
