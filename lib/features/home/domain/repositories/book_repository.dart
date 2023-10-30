import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';

abstract class BookHomeRepository {
  Future<Either<Failure, List<BookEntity>>> getPopularBooks();
}
