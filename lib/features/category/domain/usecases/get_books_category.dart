import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/core/usecases/usecases.dart';
import 'package:bbt_kirov_app/features/category/domain/repositories/book_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class AllBooks extends UseCase<List<BookEntity>> {
  final BookCategoryRepository bookRepository;

  AllBooks(this.bookRepository);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepository.getAllBooks();
  }
}

class CulinaryBooks extends UseCase<List<BookEntity>> {
  final BookCategoryRepository bookRepositoryCulinary;

  CulinaryBooks(this.bookRepositoryCulinary);

  @override
  Future<Either<Failure, List<BookEntity>>> call() async {
    return await bookRepositoryCulinary.getCulinaryBooks();
  }
}

class BooksBySize extends UseCaseByParams<List<BookEntity>, BookSizeParams> {
  final BookCategoryRepository bookRepositoryBySize;

  BooksBySize(this.bookRepositoryBySize);

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

class BooksByName extends UseCaseByParams<List<BookEntity>, BookNameParams> {
  final BookCategoryRepository bookRepositoryByName;

  BooksByName(this.bookRepositoryByName);

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

class SetBooks extends UseCaseByParams<List<BookEntity>, BookSetParams> {
  final BookCategoryRepository bookRepositorySetBooks;

  SetBooks(this.bookRepositorySetBooks);

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
