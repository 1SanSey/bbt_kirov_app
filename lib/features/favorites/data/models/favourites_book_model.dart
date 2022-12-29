import 'package:hive/hive.dart';
part 'favourites_book_model.g.dart';

@HiveType(typeId: 1)
class FavouritesBookModel extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  int price;
  @HiveField(2)
  String image;

  FavouritesBookModel(
      {required this.name, required this.price, required this.image});
}
