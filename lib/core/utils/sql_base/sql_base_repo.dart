import 'dart:async';

import 'package:aplikasi_keuangan/core/function/convert_type.dart';
import 'package:aplikasi_keuangan/core/sqflite_case/setup_db.dart';
import 'package:aplikasi_keuangan/core/utils/sql_base/sqflite_order.dart';
import 'package:sqflite/sqflite.dart';

abstract class SqlBaseRepo {
  Future<void> insertData(String table, Map<String, Object?> mapData);
  Future<List<T>> getListData<T>({
    required String table,
    required T Function(Map<String, dynamic> map) fromMap,
  });
  Future<T?> getSingleData<T>({
    required String table,
    required T Function(Map<String, dynamic> map) fromMap,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<void> deleteData({
    required String table,
    String? where,
    List<Object?>? whereArgs,
  });
  Future<T> doBatchActionValue<T>({
    required FutureOr Function(Batch batch) action,
  });
}

class SqlBaseRepoImpl implements SqlBaseRepo {
  @override
  Future<void> deleteData({
    required String table,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final database = await getAndSetupDB();
    await database.delete(
      table,
      where: where,
      whereArgs: whereArgs,
    );
  }

  @override
  Future<List<T>> getListData<T>({
    required String table,
    required T Function(Map<String, dynamic> map) fromMap,
    int? limit,
    SqfliteOrder? orderBy,
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final database = await getAndSetupDB();
    final listDBData = await database.query(
      table,
      limit: limit,
      orderBy: orderBy?.value,
      where: where,
      whereArgs: whereArgs,
    );

    final listData = listDBData.map((map) => fromMap(map)).toList();
    return listData;
  }

  @override
  Future<T?> getSingleData<T>({
    required String table,
    required T Function(Map<String, dynamic> map) fromMap,
    String? where,
    List<Object?>? whereArgs,
    SqfliteOrder? orderBy,
  }) async {
    final currDB = await getAndSetupDB();

    final listDBData = await currDB.query(
      table,
      orderBy: orderBy?.value,
      where: where,
      whereArgs: whereArgs,
    );
    final listData = listDBData.map((map) => fromMap(map)).toList();
    if (listData.isEmpty) {
      return null;
    }
    return listData.first;
  }

  @override
  Future<void> insertData(
    String table,
    Map<String, Object?> mapData,
  ) async {
    final database = await getAndSetupDB();
    await database.insert(table, mapData);
  }

  @override
  Future<T> doBatchActionValue<T>({
    required FutureOr Function(Batch batch) action,
  }) async {
    final database = await getAndSetupDB();
    final asBatch = database.batch();
    await action(asBatch);

    final result = asBatch.commit();

    assert(
      result is T,
      "Pastikan [T] sesuai dengan result bertipe${result.runtimeType}",
    );
    return result as T;
  }

  Future<int> countDataFromTable(
    String tableName, {
    String? where,
    List<Object?>? whereArgs,
  }) async {
    final currDB = await getAndSetupDB();

    final tableWithWhere = tableName + ((where ?? '').isEmpty ? '' : ' WHERE $where');
    final countData = await currDB.rawQuery(
      'SELECT COUNT(*) FROM $tableWithWhere',
      whereArgs,
    );
    final returnValue = countData.isEmpty
        ? -1
        : (countData.first.values.isEmpty
            ? -1
            : convertType<int>(countData.first.values.first) ?? 0);
    return returnValue;
  }
}
