import 'dart:developer';

import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/models/book_model.dart';
import 'package:bbt_kirov_app/features/authentication/domain/entities/user_entity.dart';
import 'package:bbt_kirov_app/features/cart/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/orders/data/models/order_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getPopularBooks();
  Future<List<BookModel>> getCulinaryBooks();
  Future<List<BookModel>> getBooksByName(String name);
  Future<List<BookModel>> getBooksBySize(String size);
  Future<List<BookModel>> getSetBooks(String singleOrSet);
  void sendOrder(OrderEntity order);
  Future<AuthenticatedUser> userLogin(String username, String password);
  Future<NotAuthenticatedUser> userLogout();
  Future<List<OrderModel>> fetchOrders(String username);
}

class BookRemoteDataSourceImpl extends BookRemoteDataSource {
  // static const String _baseUrl = 'https://parseapi.back4app.com/classes';

  static Future<void> initParse() async {
    const keyApplicationId = 'k3WLclQWTKe9pVcZUaottMLCvF2GrfjLe5NFlYM6';
    const keyClientKey = 'LvKi9oVL2hKWfU5e69MZCKnaBZYzuoKJG2nuXqoV';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);
  }

  @override
  Future<List<BookModel>> getAllBooks() async {
    List<BookModel> books = [];
    final apiResponse = await ParseObject('Books').getAll();
    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        books.add(BookModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return books;
  }

  @override
  Future<List<BookModel>> getBooksByName(String name) async {
    List<BookModel> books = [];
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Books'));
    parseQuery.whereContains('name', name);
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        books.add(BookModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return books;
  }

  @override
  Future<List<BookModel>> getPopularBooks() async {
    return _getBooksByQuery('isPopular', true);
  }

  @override
  Future<List<BookModel>> getCulinaryBooks() async {
    return _getBooksByQuery('isCulinary', true);
  }

  @override
  Future<List<BookModel>> getBooksBySize(String size) async {
    return _getBooksByQuery('size', size);
  }

  @override
  Future<List<BookModel>> getSetBooks(String singleOrSet) async {
    return _getBooksByQuery('singleOrSet', singleOrSet);
  }

  Future<List<BookModel>> _getBooksByQuery(String field, var query) async {
    List<BookModel> books = [];
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Books'));
    parseQuery.whereEqualTo(field, query);
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        books.add(BookModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return books;
  }

  @override
  void sendOrder(OrderEntity order) async {
    var parseObject = ParseObject("Orders")
      ..set("dateOrder", order.dateOrder)
      ..set("sumOrder", order.sumOrder)
      ..set("books", order.books)
      ..set("username", order.username);

    final ParseResponse parseResponse = await parseObject.save();

    if (parseResponse.success) {
      String objectId = (parseResponse.results!.first as ParseObject).objectId!;
      log('Object created: $objectId');
    } else {
      log('Object created with failed: ${parseResponse.error.toString()}');
    }
  }

  @override
  Future<AuthenticatedUser> userLogin(String username, String password) async {
    final parseUser = ParseUser(username, password, null);
    final AuthenticatedUser user;

    var response = await parseUser.login();

    if (response.success) {
      user = AuthenticatedUser.fromDb(parseUser);
      log("User was successfully login!");
      log(user.toString());
    } else {
      log(response.error!.message);
      throw ServerException();
    }

    return user;
  }

  @override
  Future<NotAuthenticatedUser> userLogout() async {
    final parseUser = await ParseUser.currentUser() as ParseUser;
    var response = await parseUser.logout();
    const NotAuthenticatedUser user = NotAuthenticatedUser();

    if (response.success) {
      log("User was successfully logout!");
    } else {
      log(response.error!.message);
    }
    return user;
  }

  @override
  Future<List<OrderModel>> fetchOrders(String username) async {
    List<OrderModel> orders = [];
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Orders'));
    parseQuery.whereEqualTo('username', username);
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        orders.add(OrderModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return orders;
  }
}
