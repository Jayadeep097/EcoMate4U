import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/product.dart';

class DbService {
  static final DbService _instance = DbService._internal();
  factory DbService() => _instance;
  DbService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    String path = join(await getDatabasesPath(), 'ecomate.db');
    return await openDatabase(
      path,
      onCreate: (db, version) async {
        await db.execute(
          'CREATE TABLE products(id TEXT PRIMARY KEY, name TEXT, price REAL, imageUrl TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      {
        'id': product.id,
        'name': product.name,
        'price': product.price,
        'imageUrl': product.imageUrl,
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');

    return List.generate(maps.length, (i) {
      return Product(
        id: maps[i]['id'],
        name: maps[i]['name'],
        price: maps[i]['price'],
        imageUrl: maps[i]['imageUrl'],
      );
    });
  }
}

