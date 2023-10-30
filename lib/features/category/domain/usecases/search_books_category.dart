import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/core/usecases/usecases.dart';
import 'package:bbt_kirov_app/features/category/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchBooksCategory
    extends UseCaseByParams<List<BookEntity>, SearchBooksParams> {
  final BookCategoryRepository searchBookRepository;

  SearchBooksCategory(this.searchBookRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call(
      SearchBooksParams params) async {
    return await searchBookRepository.getBooksByName(params.query);
  }
}

class SearchBooksParams extends Equatable {
  final String query;

  const SearchBooksParams({required this.query});

  @override
  List<Object?> get props => [query];
}
