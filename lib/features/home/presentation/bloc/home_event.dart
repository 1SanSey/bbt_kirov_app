part of 'home_bloc.dart';

abstract class HomeBooksEvent extends Equatable {
  const HomeBooksEvent();

  @override
  List<Object?> get props => [];
}

class HomeBooksEmptyEvent extends HomeBooksEvent {}

class HomeLoadBooksEvent extends HomeBooksEvent {}
