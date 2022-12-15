part of 'category_bloc.dart';

abstract class CategoryBooksEvent extends Equatable {
  const CategoryBooksEvent();

  @override
  List<Object> get props => [];
}

class CategoryLoadAllBooksEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadAllBooksEvent({required this.param});
}

class CategoryLoadBooksBySizeEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadBooksBySizeEvent({required this.param});
}

class CategoryLoadBooksByNameEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadBooksByNameEvent({required this.param});
}

class CategoryLoadBooksSetEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadBooksSetEvent({required this.param});
}

class CategoryLoadCulinaryBooksEvent extends CategoryBooksEvent {
  final String param;

  const CategoryLoadCulinaryBooksEvent({required this.param});
}
