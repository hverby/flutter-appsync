import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../../../core/util/app_constants.dart';

class RealTimeLocalDataSource {
  final HiveInterface hive;

  RealTimeLocalDataSource({required this.hive});

  dynamic getData(String valueKey) {
    late final dynamic localData;
    const hiveDatabaseKey = AppConstants.app_local_db;
    try {
      if (hive.isBoxOpen(hiveDatabaseKey)) {
        final localDatabase = hive.box(hiveDatabaseKey);
        if (localDatabase.values.isNotEmpty) {
          final dynamic queryDataList = localDatabase.get("Query");
          localData = queryDataList[valueKey];
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print("Exception getLocalData : $e");
      }
    }
    return localData;
  }
}
