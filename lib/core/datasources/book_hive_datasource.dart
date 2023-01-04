import 'package:bbt_kirov_app/core/assets/hive_names.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BookHiveDataSource {
  void addToCart(CartBookModel book);
  void removeFromCart(CartBookModel book, int index);
  void changeQuantityCart(int index, int value);
  List<CartBookModel> showCart();
  void addToFavourites(FavouritesBookModel book);
  void removeFromFavourites(FavouritesBookModel book, int index);
  List<FavouritesBookModel> showFavourites();
  int totalSum();
  void removeAllCart();
}

class BookHiveDataSourceImpl extends BookHiveDataSource {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartBookModelAdapter());
    Hive.registerAdapter(FavouritesBookModelAdapter());
    await Hive.openBox<CartBookModel>(HiveBoxes.cart);
    await Hive.openBox<FavouritesBookModel>(HiveBoxes.favourites);
  }

  Box<CartBookModel> cartBox = Hive.box<CartBookModel>(HiveBoxes.cart);

  @override
  void addToCart(CartBookModel book) {
    cartBox.add(CartBookModel(
        name: book.name,
        price: book.price,
        image: book.image,
        quantity: book.quantity));
  }

  @override
  void removeFromCart(CartBookModel book, int index) {
    cartBox.deleteAt(index);
  }

  @override
  List<CartBookModel> showCart() {
    return cartBox.values.toList();
  }

  @override
  int totalSum() {
    int sum = 0;
    for (var value in cartBox.values) {
      sum = sum + value.price * value.quantity;
    }
    return sum;
  }

  @override
  void changeQuantityCart(int index, int value) async {
    var currentItem = cartBox.getAt(index);
    currentItem?.quantity = value;
    await currentItem?.save();
  }

  @override
  void removeAllCart() {
    cartBox.clear();
  }

  Box<FavouritesBookModel> favouritesBox =
      Hive.box<FavouritesBookModel>(HiveBoxes.favourites);

  @override
  void addToFavourites(FavouritesBookModel book) {
    favouritesBox.add(FavouritesBookModel(
      name: book.name,
      price: book.price,
      image: book.image,
    ));
  }

  @override
  void removeFromFavourites(FavouritesBookModel book, int index) {
    favouritesBox.deleteAt(index);
  }

  @override
  List<FavouritesBookModel> showFavourites() {
    return favouritesBox.values.toList();
  }
}
