import 'package:meta/meta.dart';
import 'package:notey/features/realtime/domain/repositories/realtime_repository.dart';

import '../datasources/realtime_local_data_source.dart';

class RealTimeRepositoryImpl implements RealTimeRepository {
  final RealTimeLocalDataSource realTimeLocalDataSource;

  RealTimeRepositoryImpl({required this.realTimeLocalDataSource});

  @override
  dynamic getLocalBalance(String accountId) {
    return realTimeLocalDataSource.getData("getTodos()");
  }
}
