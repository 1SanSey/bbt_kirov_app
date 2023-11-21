import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_categories_repository.dart';
import 'package:bbt_kirov_app/features/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class SearchBooksUsecase
    extends UseCaseByParams<List<BookEntity>, SearchBooksParams> {
  final ICategoriesRepository searchBookRepository;

  SearchBooksUsecase(this.searchBookRepository);

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
