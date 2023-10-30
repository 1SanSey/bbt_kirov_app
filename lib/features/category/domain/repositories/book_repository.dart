import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BookCategoryRepository {
  Future<Either<Failure, List<BookEntity>>> getAllBooks();
  Future<Either<Failure, List<BookEntity>>> getCulinaryBooks();
  Future<Either<Failure, List<BookEntity>>> getBooksBySize(String size);
  Future<Either<Failure, List<BookEntity>>> getBooksByName(String name);
  Future<Either<Failure, List<BookEntity>>> getSetBooks(String name);
}
