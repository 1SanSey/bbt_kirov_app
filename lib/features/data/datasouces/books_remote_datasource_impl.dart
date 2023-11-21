import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/features/data/models/book_model.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_books_remote_datasource.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';



class BooksRemoteDatasourceImpl extends IBooksRemoteDatasource {

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
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('Books'));
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
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('Books'));
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
