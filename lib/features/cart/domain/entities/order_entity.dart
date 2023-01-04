import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final DateTime dateOrder;
  final int sumOrder;
  final Map<String, int> books;

  const OrderEntity(
      {required this.dateOrder, required this.sumOrder, required this.books});

  @override
  List<Object?> get props => [dateOrder, sumOrder];
}
