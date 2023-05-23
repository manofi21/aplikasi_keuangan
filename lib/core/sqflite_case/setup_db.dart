import 'package:aplikasi_keuangan/core/sqflite_case/init_table.dart';
import 'package:aplikasi_keuangan/core/sqflite_case/update_table.dart';
import 'package:sqflite/sqflite.dart';

const int sqfLiteDatabaseVersion = 4;
const String sqfLiteDatabase = "database_aplikasi_keuangan.db";

Future<Database> getAndSetupDB() async {
    final db = await openDatabase(
    sqfLiteDatabase,
    version: sqfLiteDatabaseVersion,
    onCreate: (db, version) async {
      await initTables(
        db: db,
        version: version,
      );
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      await updateTables(
        db,
        oldVersion,
        newVersion,
      );
    },
  );
  return db;
}