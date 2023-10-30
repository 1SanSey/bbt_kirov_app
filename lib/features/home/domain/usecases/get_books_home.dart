import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/core/usecases/usecases.dart';
import 'package:bbt_kirov_app/features/home/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';

class PopularBooks extends UseCase<List<BookEntity>> {
  final BookHomeRepository bookRepository;

  PopularBooks(this.bookRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepository.getPopularBooks();
  }
}
