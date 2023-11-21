import 'package:bbt_kirov_app/features/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/domain/repositories/i_categories_repository.dart';
import 'package:bbt_kirov_app/features/domain/usecases/usecases.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AllBooksUsecase extends UseCase<List<BookEntity>> {
  final ICategoriesRepository bookRepository;

  AllBooksUsecase(this.bookRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepository.getAllBooks();
  }
}

class CulinaryBooksUsecase extends UseCase<List<BookEntity>> {
  final ICategoriesRepository bookRepositoryCulinary;

  CulinaryBooksUsecase(this.bookRepositoryCulinary);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepositoryCulinary.getCulinaryBooks();
  }
}

class BooksBySizeUsecase extends UseCaseByParams<List<BookEntity>, BookSizeParams> {
  final ICategoriesRepository bookRepositoryBySize;

  BooksBySizeUsecase(this.bookRepositoryBySize);

  @override
  Future<Either<Failure, List<BookEntity>>> call(BookSizeParams params) async {
    return await bookRepositoryBySize.getBooksBySize(params.size);
  }
}

class BookSizeParams extends Equatable {
  final String size;

  const BookSizeParams({required this.size});

  @override
  List<Object?> get props => [size];
}

class BooksByNameUsecase extends UseCaseByParams<List<BookEntity>, BookNameParams> {
  final ICategoriesRepository bookRepositoryByName;

  BooksByNameUsecase(this.bookRepositoryByName);

  @override
  Future<Either<Failure, List<BookEntity>>> call(BookNameParams params) async {
    return await bookRepositoryByName.getBooksByName(params.name);
  }
}

class BookNameParams extends Equatable {
  final String name;

  const BookNameParams({required this.name});

  @override
  List<Object?> get props => [name];
}

class SetBooksUsecase extends UseCaseByParams<List<BookEntity>, BookSetParams> {
  final ICategoriesRepository bookRepositorySetBooks;

  SetBooksUsecase(this.bookRepositorySetBooks);

  @override
  Future<Either<Failure, List<BookEntity>>> call(BookSetParams params) async {
    return await bookRepositorySetBooks.getSetBooks(params.singleOrSet);
  }
}

class BookSetParams extends Equatable {
  final String singleOrSet;

  const BookSetParams({required this.singleOrSet});

  @override
  List<Object?> get props => [singleOrSet];
}
