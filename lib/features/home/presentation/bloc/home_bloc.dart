import 'dart:async';

import 'package:bbt_kirov_app/core/error/failure.dart';
import 'package:bbt_kirov_app/features/home/domain/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/home/domain/usecases/get_books.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

const serverFailureMessage = 'Server Failure';
const internetConnectionFailureMessage = 'Internet Connection Failure';

class HomeBooksBloc extends Bloc<HomeBooksEvent, HomeBooksState> {
  final PopularBooks popularBooks;

  HomeBooksBloc({required this.popularBooks}) : super(HomeBooksEmpty()) {
    on<HomeLoadBooksEvent>(_onEvent);
  }

  FutureOr<void> _onEvent(
      HomeLoadBooksEvent event, Emitter<HomeBooksState> emit) async {
    emit(HomeBooksLoading());

    final failureOrBooks = await popularBooks();

    failureOrBooks.fold(
        (failure) =>
            emit(HomeBooksError(message: _mapFailureToMessage(failure))),
        (books) {
      emit(HomeBooksLoaded(books: books));
    });
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailureMessage;
      case InternetConnectionFailure:
        return internetConnectionFailureMessage;
      default:
        return 'Unexpected Error';
    }
  }
}
