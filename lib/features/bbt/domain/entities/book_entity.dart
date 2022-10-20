import 'package:equatable/equatable.dart';

class BookEntity extends Equatable {
  final String name;
  final int price;
  final String image;
  final String description;
  final String size;
  final String singleOrSet;

  const BookEntity(
      {required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.size,
      required this.singleOrSet});

  @override
  List<Object?> get props => [name, price];
}
