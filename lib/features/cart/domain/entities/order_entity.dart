import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String username;
  final DateTime dateOrder;
  final int sumOrder;
  final Map<String, dynamic> books;

  const OrderEntity(
      {required this.username,
      required this.dateOrder,
      required this.sumOrder,
      required this.books});

  @override
  List<Object?> get props => [dateOrder, sumOrder];
}
