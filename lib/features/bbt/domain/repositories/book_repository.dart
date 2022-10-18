import 'package:bbt_kirov_app/features/bbt/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

abstract class BookRepository {
  Future<Either<Failure, List<BookEntity>>> getAllBooks();
}
