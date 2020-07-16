import 'package:redux_logging_example/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart" as path;

class SqliteService {
  final _dbName = "my.db";

  Future<Database> _connect() async {
    String dbFilePath = await getFilePath();

    return await openDatabase(
      dbFilePath,
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE todos(id INTEGER PRIMARY KEY, body TEXT, completed TINYINT)",
        );
      },
      version: 1,
    );
  }

  delete() async {
    String filePath = await getFilePath();
    await deleteDatabase(filePath);
  }

  Future<String> getFilePath() async {
    String dbPath = await getDatabasesPath();
    String dbFilePath = path.join(dbPath, _dbName);

    return dbFilePath;
  }

  Future<void> insertTodo(TodoDetail todo) async {
    Database db = await _connect();

    await db.insert(
      "todos",
      todo.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<Todos> getTodos() async {
    Database db = await _connect();

    List<Map<String, dynamic>> result = await db.query("todos");

    return Todos(
      items: List.generate(
        result.length,
        (index) => TodoDetail(
          id: result[index]["id"],
          body: result[index]["body"],
          completed: result[index]["completed"],
        ),
      ),
    );
  }
}
