import 'dart:async';

import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/get_books_category.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/search_books_category.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
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
  final SearchBooksCategory searchBooks;

  CategoryBooksBloc({
    required this.booksByName,
    required this.setBooks,
    required this.booksBySize,
    required this.allBooks,
    required this.culinaryBooks,
    required this.searchBooks,
  }) : super(CategoryBooksEmpty()) {
    on<CategoryLoadAllBooksEvent>(_onEventAllBooks, transformer: droppable());
    on<CategoryLoadBooksBySizeEvent>(_onEventBooksBySize,
        transformer: droppable());
    on<CategoryLoadBooksByNameEvent>(_onEventBooksByName,
        transformer: droppable());
    on<CategoryLoadBooksSetEvent>(_onEventBooksSet, transformer: droppable());
    on<CategoryLoadCulinaryBooksEvent>(_onEventCulinaryBooks,
        transformer: droppable());
    on<CategorySearchBooksEvent>(_onEventSearchBooks, transformer: droppable());
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

  FutureOr<void> _onEventSearchBooks(
      CategorySearchBooksEvent event, Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks =
        await searchBooks(SearchBooksParams(query: event.query));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }
}
