import 'package:path/path.dart';
import 'package:socialapp/models/Cartproductmodel.dart';
import 'package:sqflite/sqflite.dart';

import '../constants.dart';
class CartDatabaseHelper{
  CartDatabaseHelper._();
  static final CartDatabaseHelper db=CartDatabaseHelper._();
  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database=await initdb();
    return _database;
  }

  initdb()async{
    String path =join(await getDatabasesPath(),'CartProduct.db');
     return await openDatabase(path,version: 5,onCreate: (Database db,int version)async{
       await db.execute(''
           'CREATE TABLE $TabelCartProduct ($columnName TEXT ,$columnimage TEXT,$columnprice TEXT,$columnQuantity INTEGER,$columnProductId TEXT)');
     });
  }

  insert(CartProductModel model)async{
    var dbclient=await database;
    await dbclient.insert(TabelCartProduct, model.toJson());
  }

  getallproducts()async{
    var dbclient=await database;
  List<Map> maps=  await dbclient.query(TabelCartProduct);
  List<CartProductModel> list =maps.isNotEmpty?
      maps.map((e) => CartProductModel.fromJson(e)).toList():[];
  return list;
  }
  updateprice(CartProductModel model)async{
    var dbclient=await database;
   return await dbclient.update(TabelCartProduct, model.toJson(),
      where: '$columnProductId = ?',whereArgs: [model.productId],
    );
  }
}