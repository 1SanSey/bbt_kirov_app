import 'package:equatable/equatable.dart';

class OrderEntity extends Equatable {
  final String userId;
  final DateTime dateOrder;
  final int sumOrder;
  final Map<String, dynamic> books;

  const OrderEntity({
    required this.userId,
    required this.dateOrder,
    required this.sumOrder,
    required this.books,
  });

  @override
  List<Object?> get props => [userId, dateOrder, sumOrder, books];

  @override
  String toString() {
    return '(userId: $userId, dateOrder: $dateOrder, sumOrder: $sumOrder, books: $books)';
  }
}
