import 'dart:async';

import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/features/category/domain/usecases/get_books_category.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBooksBySizeBloc
    extends Bloc<CategoryBooksEvent, CategoryBooksState> {
  final BooksBySize booksBySize;

  CategoryBooksBySizeBloc({required this.booksBySize})
      : super(CategoryBooksEmpty()) {
    on<CategoryLoadBooksEvent>(_onEventBooksBySize);
  }

  FutureOr<void> _onEventBooksBySize(
      CategoryLoadBooksEvent event, Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await booksBySize(BookSizeParams(size: event.param));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }
}

class CategoryBooksByNameBloc
    extends Bloc<CategoryBooksEvent, CategoryBooksState> {
  final BooksByName booksByName;

  CategoryBooksByNameBloc({required this.booksByName})
      : super(CategoryBooksEmpty()) {
    on<CategoryLoadBooksEvent>(_onEventBooksByName);
  }

  FutureOr<void> _onEventBooksByName(
      CategoryLoadBooksEvent event, Emitter<CategoryBooksState> emit) async {
    emit(CategoryBooksLoading());

    final failureOrBooks = await booksByName(BookNameParams(name: event.param));

    failureOrBooks.fold(
        (failure) =>
            emit(CategoryBooksError(message: mapFailureToMessage(failure))),
        (books) {
      emit(CategoryBooksLoaded(books: books));
    });
  }
}

class CategoryBooksSetBloc
    extends Bloc<CategoryBooksEvent, CategoryBooksState> {
  final SetBooks setBooks;

  CategoryBooksSetBloc({required this.setBooks}) : super(CategoryBooksEmpty()) {
    on<CategoryLoadBooksEvent>(_onEventBooksSet);
  }

  FutureOr<void> _onEventBooksSet(
      CategoryLoadBooksEvent event, Emitter<CategoryBooksState> emit) async {
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
}