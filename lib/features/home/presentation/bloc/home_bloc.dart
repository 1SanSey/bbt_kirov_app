import 'dart:async';

import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/domain/usecases/get_books_home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  final PopularBooks popularBooks;

  HomeBooksBloc({required this.popularBooks}) : super(HomeBooksEmpty()) {
    on<HomeLoadBooksEvent>(_onEvent);
    on<HomeBooksEmptyEvent>(_onEmptyEvent);
  }

  FutureOr<void> _onEvent(
      HomeLoadBooksEvent event, Emitter<HomeBooksState> emit) async {
    emit(HomeBooksLoading());

    final failureOrBooks = await popularBooks();

    failureOrBooks.fold(
        (failure) =>
            emit(HomeBooksError(message: mapFailureToMessage(failure))),
        (books) {
      //log(books.toString());
      emit(HomeBooksLoaded(books: books));
    });
  }

  FutureOr<void> _onEmptyEvent(
      HomeBooksEmptyEvent event, Emitter<HomeBooksState> emit) {
    emit(HomeBooksEmpty());
  }
}
