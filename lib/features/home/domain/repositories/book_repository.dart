import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/bbt/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookEntity>>> getAllBooks();
  Future<Either<Failure, List<BookEntity>>> getBooksBySize(String size);
  Future<Either<Failure, List<BookEntity>>> getBooksByName(String name);
  Future<Either<Failure, List<BookEntity>>> getSetBooks(String name);
}
