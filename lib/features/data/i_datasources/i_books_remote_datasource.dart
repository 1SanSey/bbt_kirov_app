import 'package:bbt_kirov_app/features/data/models/book_model.dart';

abstract class IBooksRemoteDatasource {
  Future<List<BookModel>> getAllBooks();
  Future<List<BookModel>> getPopularBooks();
  Future<List<BookModel>> getCulinaryBooks();
  Future<List<BookModel>> getBooksByName(String name);
  Future<List<BookModel>> getBooksBySize(String size);
  Future<List<BookModel>> getSetBooks(String singleOrSet);
}
