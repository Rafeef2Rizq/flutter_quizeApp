import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DatabaseLite {
  static final DatabaseLite _instance = DatabaseLite.internal();
  factory DatabaseLite() => _instance;

  static Database? _database;

  final String table = 'myTable';
DatabaseLite.internal();

  Future<Database> get database async {
    if (_database == null) {
      _database = await initDatabase();
    }
    return _database!;
  }

  Future<Database> initDatabase() async {
    String databasePath = await getDatabasesPath();
    String paths = path.join(databasePath, 'quiz.db');
    Database mydb = await openDatabase(paths, version: 1, onCreate: _onCreate);
    return mydb;
  }

  void _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        A TEXT NOT NULL,
        B TEXT NOT NULL,
        C TEXT NOT NULL,
        D TEXT NOT NULL,
        S TEXT
      )
      ''');
  }

  Future<int> insertQuestion(Question item) async {
    Database db = await database;
    return await db.insert(table, item.toMap());
  }

  Future<List<Question>> getQuestions() async {
    List<Question> temp = [];
    Database db = await database;
    List<Map<String, dynamic>> maps = await db.query(table);
    maps.forEach((element) {
      if (!temp.contains(Question.fromMap(element))) {
        temp.add(Question.fromMap(element));
      }
    });
    return temp;
  }

  Future<int> updateQuestion(Question item) async {
    Database db = await database;
    return await db.update(
      table,
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteQuestion(int id) async {
    Database db = await database;
    return await db.delete(
      table,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}

class Question {
  late int id;
  late String name;
  late String A;
  late String B;
  late String C;
  late String D;
  late String S;

  Question.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
    this.A = map['A'];
    this.B = map['B'];
    this.C = map['C'];
    this.S = map['S'];
    this.D = map['D'];
  }

  Question();

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'A': A,
      'B': B,
      'C': C,
      'D': D,
      'S': S,
    };
  }
}