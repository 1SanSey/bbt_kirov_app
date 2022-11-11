import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/core/models/book_model.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

abstract class BookRemoteDataSource {
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getPopularBooks();
  Future<List<BookModel>> getCulinaryBooks();
  Future<List<BookModel>> getBooksByName(String name);
  Future<List<BookModel>> getBooksBySize(String size);
  Future<List<BookModel>> getSetBooks(String singleOrSet);
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

  List<BookModel> books = [];

  @override
  Future<List<BookModel>> getAllBooks() async {
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

/*   @override
  Future<List<BookModel>> getPopularBooks() async {
    final QueryBuilder<ParseObject> parseQuery =
        QueryBuilder<ParseObject>(ParseObject('Books'));
    parseQuery.whereEqualTo('isPopular', true);
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        books.add(BookModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return books;
  } */

  @override
  Future<List<BookModel>> getBooksByName(String name) async {
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
}