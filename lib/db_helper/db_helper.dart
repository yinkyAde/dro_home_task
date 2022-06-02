import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../model/cart.dart';

class DBHelper {
  static Database? _db;
  DatabaseFactory? databaseFactory;
  String? path;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }

    _db = await initDatabase();
    return _db!;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
     path = join(documentDirectory.path, 'cart.db');
    var db = await openDatabase(
      path!,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    databaseFactory?.deleteDatabase(path!);
    await db.execute(
        'CREATE TABLE cart (id INTEGER PRIMARY KEY , productId VARCHAR UNIQUE,productName TEXT,productImage TEXT, productType TEXT, productMeasurement TEXT,productPrice INTEGER , quantity INTEGER, initialPrice INTEGER )');
  }

  Future<Cart> insert(Cart cart) async {
    //print(cart.toMap());
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toMap());
    return cart;
  }

  Future<List<Cart>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
        await dbClient!.query('cart');
    return queryResult.map((e) => Cart.fromMap(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    databaseFactory?.deleteDatabase(path!);
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(Cart cart) async {
    var dbClient = await db;
    return await dbClient!
        .update('cart', cart.toMap(), where: 'id = ?', whereArgs: [cart.id]);
  }
}
