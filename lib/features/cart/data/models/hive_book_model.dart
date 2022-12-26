import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveBookModel {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  String? image;
  @HiveField(3)
  String quantity;

  HiveBookModel(
      {required this.name,
      required this.price,
      required this.quantity,
      required this.image});
}
