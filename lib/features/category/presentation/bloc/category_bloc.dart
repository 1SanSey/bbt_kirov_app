import 'dart:async';

import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/get_books_category.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBooksBloc extends Bloc<CategoryBooksEvent, CategoryBooksState> {
  final AllBooks allBooks;
  final CulinaryBooks culinaryBooks;
  final BooksBySize booksBySize;
  final BooksByName booksByName;
  final SetBooks setBooks;

  CategoryBooksBloc(
      {required this.booksByName,
      required this.setBooks,
      required this.booksBySize,
      required this.allBooks,
      required this.culinaryBooks})
      : super(CategoryBooksEmpty()) {
    on<CategoryLoadAllBooksEvent>(_onEventAllBooks);
    on<CategoryLoadBooksBySizeEvent>(_onEventBooksBySize);
    on<CategoryLoadBooksByNameEvent>(_onEventBooksByName);
    on<CategoryLoadBooksSetEvent>(_onEventBooksSet);
    on<CategoryLoadCulinaryBooksEvent>(_onEventCulinaryBooks);
  }

  FutureOr<void> _onEventAllBooks(
      CategoryLoadAllBooksEvent event, Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await allBooks();

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }

  FutureOr<void> _onEventBooksBySize(CategoryLoadBooksBySizeEvent event,
      Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await booksBySize(BookSizeParams(size: event.param));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }

  FutureOr<void> _onEventBooksByName(CategoryLoadBooksByNameEvent event,
      Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await booksByName(BookNameParams(name: event.param));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }

  FutureOr<void> _onEventBooksSet(
      CategoryLoadBooksSetEvent event, Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks =
        await setBooks(BookSetParams(singleOrSet: event.param));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }

  FutureOr<void> _onEventCulinaryBooks(CategoryLoadCulinaryBooksEvent event,
      Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await culinaryBooks();

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }
}
