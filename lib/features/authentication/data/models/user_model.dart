/* import 'package:bbt_kirov_app/features/authentication/domain/entities/user_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserModel extends UserEntity {
  const UserModel({
    required uid,
    required displayName,
    required photoURL,
    required email,
  }) : super(
          uid: uid,
          displayName: displayName,
          photoURL: photoURL,
          email: email,
        );

  factory UserModel.fromDb(ParseObject object) {
    return UserModel(
      name: object.get<String>('name'),
      price: object.get<int>('price'),
      isPopular: object.get<bool>('isPopular'),
      image: object.get<String>('image') ?? '',
      description: object.get<String>('description') ?? '',
      size: object.get<String>('size') ?? '',
      singleOrSet: object.get<String>('singleOrSet') ?? '',
      quantity: object.get<int>('quantity'),
    );
  }
}
 */