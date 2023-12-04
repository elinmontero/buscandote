


import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' as sql;


class DBHelper{
  // Elin Encarnacion Montero --- 2019-8580

 // creando la tabla registros
  static Future<void> createTables(sql.Database database) async {   
    
      await database.execute
      ("CREATE TABLE registros(id INTEGER PRIMARY KEY AUTOINCREMENT,"
      " image TEXT, name TEXT, age TEXT, gender TEXT, height TEXT,"
      "information TEXT, lugar TEXT, date TEXT, status TEXT)");
              

  }

  // creando la base de datos
  static Future<sql.Database> db() async{

    return sql.openDatabase('registro_desaparecidos.db',
    version: 1,
    onCreate: (sql.Database database, int version) async {
      
      await createTables(database);
      
    },
    );

  }

  // metodo para agregar un registro 
  static Future<int> insertRegister(String image, String name, String age, String gender,
    String height, String information, String lugar, String date, String status) async {
    final db = await DBHelper.db();
    

    final data = {'image': image,
    'name': name,
    'age': age,
    'gender': gender,
    'height': height,
    'information': information,
    'lugar': lugar,
    'date': date,
    'status': status,

    };
    final id = await db.insert('registros', data, 
    conflictAlgorithm: sql.ConflictAlgorithm.replace);

    return id;
  }
  

  // creando una lista de todos los registros agregados
  static Future<List<Map<String, dynamic>>> getRegisters() async {

    final db = await DBHelper.db();
    return db.query('registros', orderBy: 'id');   
  }


  // metodo para filtrar busqueda de registros
  static Future<List<Map<String, dynamic>>> searchRegisters(String? name) async {

    final db = await DBHelper.db();    

    return db.query('registros', 
    where: 'name LIKE ?', whereArgs: ['%$name%']      
    );
    
          
  }


  // metodo para actualizar registro
  static Future<int> updateRegister(int id, String image, String name, String age, String gender,
    String height, String information, String lugar, String date, String status) async {

    final db = await DBHelper.db();
    final data = {
      'image': image,
    'name': name,
    'age': age,
    'gender': gender,
    'height': height,
    'information': information,
    'lugar': lugar,
    'date': date,
    'status': status, 
    
      

    };

    final result = await db.update('registros', 
    data , where: 'id = ?', whereArgs: [id]      
    );
    return result;
  }


  // eliminar un registro seleccionado
  static Future<void> deleteRegister(int id) async {
    final db = await DBHelper.db();

    try {
      await db.delete('registros', where: 'id = ?', whereArgs: [id]
    
    );
  } catch (error) {
    debugPrint("Error deleting: $error");

}
  }
}

