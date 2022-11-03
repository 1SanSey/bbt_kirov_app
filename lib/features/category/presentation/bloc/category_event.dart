part of 'category_bloc.dart';

abstract class CategoryBooksEvent extends Equatable {
  const CategoryBooksEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoadBooksEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadBooksEvent({required this.param});
}
