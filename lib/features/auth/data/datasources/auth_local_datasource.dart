
import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:notey/features/auth/data/models/user_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/providers/hive_helper.dart';
import '../../../../core/util/app_constants.dart';

abstract class AuthLocalDataSource {
  Future<UserModel> getUser();
  Future<void> cacheUSer(UserModel userModel);
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource{
  final HiveInterface hive;

  AuthLocalDataSourceImpl({required this.hive});

  @override
  Future<void> cacheUSer(UserModel userModel) async {
    try {
      HiveHelper hiveHelper = HiveHelper(hive: this.hive);
      //final String user = json.encode(userModel);
      await hiveHelper.setValue(AppConstants.userKey, userModel.toJsonCache());
    } catch (e) {
      print(e);
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<UserModel> getUser() async{
    try {
      HiveHelper hiveHelper = HiveHelper(hive: this.hive);
      final String resultString = hiveHelper.getValue(AppConstants.userKey);
      final UserModel userModel = UserModel.fromJsonCache(resultString);
      return userModel;
    } catch (e) {
      print(e);
      throw CacheFailure(message: e.toString());
    }
  }

}
