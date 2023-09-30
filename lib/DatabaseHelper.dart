import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    sqfliteFfiInit(); // Inisialisasi sqflite_common_ffi

    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'books.db');

    try {
      return await openDatabase(path, version: 1, onCreate: _createDatabase);
    } catch (e) {
      print("Error opening database: $e");
      throw e;
    }
  }


  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE books (
        id TEXT PRIMARY KEY,
        title TEXT,
        genre TEXT,
        author TEXT,
        rating REAL,
        image TEXT,
        language TEXT,
        releaseDate TEXT,
        pageCount INTEGER,
        sinopsis TEXT,
        bookPages TEXT  -- Kolom untuk menyimpan daftar halaman buku (dalam format teks)
      )
    ''');
  }

  Future<int> insertBook(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert('books', row, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> queryAllBooks() async {
    Database db = await instance.database;
    return await db.query('books');
  }

  Future<int> updateBook(Map<String, dynamic> row) async {
    Database db = await instance.database;
    String id = row['id'];
    return await db.update('books', row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteBook(String id) async {
    Database db = await instance.database;
    return await db.delete('books', where: 'id = ?', whereArgs: [id]);
  }
}
