import 'dart:async';

import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/domain/usecases/get_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const INTERNET_CONNECTION_FAILURE_MESSAGE = 'Internet Connection Failure';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  final PopularBooks popularBooks;

  HomeBooksBloc({required this.popularBooks}) : super(HomeBooksEmpty()) {
    on<HomeLoadBooksEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      HomeLoadBooksEvent event, Emitter<HomeBooksState> emit) async {
    emit(HomeBooksLoading());

    final failureOrBooks = await popularBooks();
    //print(failureOrBooks);

    failureOrBooks.fold(
        (failure) =>
            emit(HomeBooksError(message: _mapFailureToMessage(failure))),
        (books) {
      //print(books);
      emit(HomeBooksLoaded(books: books));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case InternetConnectionFailure:
        return INTERNET_CONNECTION_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
