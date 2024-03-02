// ignore_for_file: avoid_final_parameters

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required final String uid,
    required final String displayName,
    required final String photoURL,
    required final String email,
    required final String role,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) => _$UserEntityFromJson(json);

  factory UserEntity.empty() {
    return const UserEntity(
      uid: '',
      displayName: '',
      photoURL: '',
      email: '',
      role: '',
    );
  }

  factory UserEntity.fromDb(ParseUser user, String role) {
    return UserEntity(
      uid: user.get<String>('objectId')!,
      displayName: user.get<String>('username') ?? '',
      photoURL: user.get<ParseFile>('userphoto')?.url ?? '',
      email: user.get<String>('email') ?? '',
      role: role,
    );
  }
}

// @immutable
// class NotAuthenticatedUser implements UserEntity {
//   @literal
//   const NotAuthenticatedUser();

//   @override
//   bool get isAuthenticated => false;

//   @override
//   bool get isNotAuthenticated => true;

//   @override
//   AuthenticatedUser? get authenticatedOrNull => null;

//   @override
//   T when<T extends Object?>({
//     required final T Function(AuthenticatedUser user) authenticated,
//     required final T Function() notAuthenticated,
//   }) =>
//       notAuthenticated();

//   @override
//   String toString() => 'User is not authenticated';

//   @override
//   bool operator ==(final Object other) => other is NotAuthenticatedUser;

//   @override
//   int get hashCode => 0;
// }

// @immutable
// class AuthenticatedUser implements UserEntity {
//   const AuthenticatedUser({
//     required this.uid,
//     required this.displayName,
//     required this.photoURL,
//     required this.email,
//   });

//   @override
//   bool get isAuthenticated => !isNotAuthenticated;

//   @override
//   bool get isNotAuthenticated => uid.isEmpty;

//   @override
//   AuthenticatedUser? get authenticatedOrNull => isNotAuthenticated ? null : this;

//   final String uid;
//   final String? displayName;
//   final String? photoURL;
//   final String? email;

//   @override
//   T when<T extends Object?>({
//     required final T Function(AuthenticatedUser user) authenticated,
//     required final T Function() notAuthenticated,
//   }) =>
//       authenticated(this);

//   @override
//   String toString() => 'UserEntity('
//       'uid: $uid, '
//       'displayName: $displayName, '
//       'email: $email, '
//       'photoURL: $photoURL)';

//   @override
//   bool operator ==(final Object other) => other is AuthenticatedUser && uid == other.uid;

//   @override
//   int get hashCode => uid.hashCode;

//   factory AuthenticatedUser.fromDb(ParseUser user) {
//     return AuthenticatedUser(
//       uid: user.get<String>('objectId')!,
//       displayName: user.get<String>('username'),
//       photoURL: user.get<ParseFile>('userphoto')?.url ?? '',
//       email: user.get<String>('email'),
//     );
//   }

//   // factory AuthenticatedUser.fromJson(Map<String, dynamic> json) =>
//   //     _$AuthenticatedUserFromJson(json);

//   //  factory AuthenticatedUser.toJson(AuthenticatedUser user) =>  _$AuthenticatedUserToJson(user);
// }
