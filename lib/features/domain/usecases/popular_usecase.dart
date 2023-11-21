import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_books_home_repository.dart';
import 'package:bbt_kirov_app/features/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';

class PopularUsecase extends UseCase<List<BookEntity>> {
  final IBooksHomeRepository bookRepository;

  PopularUsecase(this.bookRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepository.getPopularBooks();
  }
}
