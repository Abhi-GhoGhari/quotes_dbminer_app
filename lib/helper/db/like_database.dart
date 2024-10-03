import 'package:logger/logger.dart';
import 'package:quotes_dbminer_app/headers.dart';
import 'package:sqflite/sqflite.dart';

// .delete(likeTable, where: 'id = ?', whereArgs: [data['id']])
enum QuoteTable { id, quote, author }

class LikeDataBase {
  LikeDataBase._();
  static final LikeDataBase likeDataBase = LikeDataBase._();

  String dbName = 'QuotesDataBase.db';
  late Database database;
  Logger logger = Logger();
  String likeTable = 'likeTable';
  String sql = 'Query here';

  Future<void> addFavQuote(Qutoemodal q) async {
    Map<String, dynamic> data = q.toJson();
    data.remove('id');
    await database
        .insert(likeTable, data)
        .then((value) => logger.i("INSERTED ${q.author} "))
        .onError(
            (error, stackTrace) => logger.e("ERROR: ${q.author}/n $error"));
  }

  Future<void> deleteFavQuote(Qutoemodal q) async {
    await database
        .delete(likeTable, where: 'id = ?', whereArgs: [q.id])
        .then((value) => logger.i("DELETED ${q.author} "))
        .onError(
            (error, stackTrace) => logger.e("ERROR: ${q.author}/n $error"));
  }

  Future<List<Qutoemodal>> getAllData() async {
    sql = 'SELECT * FROM $likeTable;';
    List<Map<String, dynamic>> data = await database.rawQuery(sql);
    return data.map((e) => Qutoemodal.fromJson(e)).toList();
  }

  Future<void> initDataBase() async {
    String dbPath = await getDatabasesPath();
    database = await openDatabase(
      "$likeTable/$dbPath",
      version: 4,
      onCreate: (db, v) {
        String sql = """ CREATE TABLE IF NOT EXISTS $likeTable (
        ${QuoteTable.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
        ${QuoteTable.quote.name} TEXT,
        ${QuoteTable.quote.name} TEXT,
        );""";
        db
            .execute(sql)
            .then(
              (value) => logger.i("TABLE CREATED"),
            )
            .onError(
              (error, stackTrace) => logger.i(error.toString()),
            );
      },
      onUpgrade: (db, oldVersion, newVersion) {
        String sql = """CREATE TABLE $likeTable (
    ${QuoteTable.id.name} INTEGER PRIMARY KEY AUTOINCREMENT,
    ${QuoteTable.quote.name} TEXT NOT NULL,
    ${QuoteTable.author.name} TEXT NOT NULL);""";

        db
            .execute(sql)
            .then(
              (value) => logger.i("TABLE CREATED"),
            )
            .onError(
              (error, stackTrace) => logger.e("ERROR $error"),
            );
      },
    );
  }
}
