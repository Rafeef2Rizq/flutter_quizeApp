import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' as path;

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static  Database? _db; //? for accept null

  final String table = 'myTable';
  final String columnId = 'id';
  final String columnName = 'name';
  final String columnA = 'A';
  final String columnB = 'B';
  final String columnC = 'C';
  final String columnD = 'D';
  final String columnS = 'S';

  DatabaseHelper.internal();

   get database async {
    if(_db ==null){
 _db = await initDatabase();
    return _db;
    }
    return _db;
  }

   initDatabase() async {
    String databasePath = await getDatabasesPath();//method to put default database location
    String paths = path.join(databasePath, 'doubleR.db'); //to joint path with name of database
    Database mydb= await openDatabase(  paths, version: 1, onCreate: _onCreate );//to establish database
    return mydb;
  }
  _onCreate (Database db, int version) async { //function by it we can create the database for colums
        await db.execute( // اما اضافة التعليمات بسطر واحد او اضافة الثلاث نقاط عشان يعرفة انو بننزل اسطر
          '''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnA TEXT  NOT NULL,
            $columnB TEXT  NOT NULL,
            $columnC TEXT  NOT NULL,
            $columnD TEXT  NOT NULL,
            $columnS TEXT
          )
          ''',
        );
      }
  Future<int> insertItem(Question item) async {
    Database db = await database;
    return await db.insert(table, item.toMap());
  }

  Future<List<Question>> questions() async {
    List<Question> temp = [];
    Database db = await database;
    List<Map> maps = await db.query(table);
    maps.forEach((element) {
      if(!temp.contains(Question.FromJs(element))){
        temp.add(Question.FromJs(element));
      }
    });
    return temp;
  }

  Future<int> updateItem(Question item) async {
    Database db = await database;
    return await db.update(
      table,
      item.toMap(),
      where: '$columnId = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteItem(int id) async {
    Database db = await database;
    return await db.delete(
      table,
      where: '$columnId = ?',
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
  Question.FromJs(Map<dynamic,dynamic>map){
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
