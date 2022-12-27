import 'package:hive/hive.dart';
part 'cart_book_model.g.dart';

@HiveType(typeId: 0)
class CartBookModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  String image;
  @HiveField(3)
  int quantity;

  CartBookModel(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.image});
}
