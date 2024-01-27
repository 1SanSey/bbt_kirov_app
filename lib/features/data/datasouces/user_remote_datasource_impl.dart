import 'dart:developer';

import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_user_remote_datasorce.dart';
import 'package:bbt_kirov_app/features/domain/entities/user_entity/user_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class UserRemoteDatasourceImpl extends IUserRemoteDatasource {
  @override
  Future<String> userRegister(String username, String password, String email) async {
    final parseUser = ParseUser.createUser(username, password, email);
    final response = await parseUser.signUp();

    if (response.success) {
      log('User was successfully register!');

      return 'Success';
    } else {
      log(response.error!.message);
      throw ServerException();
    }
  }

  @override
  Future<UserEntity> userLogin(String username, String password) async {
    final parseUser = ParseUser(username, password, null);
    final UserEntity user;

    final response = await parseUser.login();

    if (response.success) {
      user = UserEntity.fromDb(parseUser);
      log('User was successfully login!');
      log(user.toString());
    } else {
      log(response.error!.message);
      throw ServerException();
    }

    return user;
  }

  @override
  Future<UserEntity> userLogout() async {
    final parseUser = await ParseUser.currentUser() as ParseUser;
    final response = await parseUser.logout();
    final user = UserEntity.empty();

    if (response.success) {
      log('User was successfully logout!');
    } else {
      log(response.error!.message);
    }

    return user;
  }
}
