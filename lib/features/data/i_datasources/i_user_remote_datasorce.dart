import 'package:bbt_kirov_app/features/domain/entities/user_entity/user_entity.dart';

abstract class IUserRemoteDatasource {
  Future<UserEntity> userLogin(String username, String password);
  Future<String> userRegister(String username, String password, String email);
  Future<UserEntity> userLogout();
}
