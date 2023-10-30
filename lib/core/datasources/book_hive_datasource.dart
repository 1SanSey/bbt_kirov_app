import 'package:bbt_kirov_app/core/assets/hive_names.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:bbt_kirov_app/features/favorites/data/models/favourites_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BookHiveDataSource {
  String addToCart(CartBookModel book);
  void removeFromCart(int index);
  void changeQuantityCart(int index, int value);
  List<CartBookModel> showCart();
  String addToFavourites(FavouritesBookModel book);
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
  String addToCart(CartBookModel book) {
    bool isExist = false;
    String message = '';

    if (cartBox.values.isNotEmpty) {
      for (var item in cartBox.values) {
        if (item.name == book.name) {
          isExist = true;
          message = 'Товар уже есть в корзине!';
          break;
        }
      }
      if (!isExist) {
        cartBox.add(CartBookModel(
            name: book.name,
            price: book.price,
            image: book.image,
            quantity: book.quantity));

        message = 'Товар добавлен в корзину!';
      }
    } else {
      cartBox.add(CartBookModel(
          name: book.name,
          price: book.price,
          image: book.image,
          quantity: book.quantity));

      message = 'Товар добавлен в корзину!';
    }

    return message;
  }

  @override
  void removeFromCart(int index) {
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
    await cartBox.putAt(index, currentItem!);
  }

  @override
  void removeAllCart() {
    cartBox.clear();
  }

  Box<FavouritesBookModel> favouritesBox =
      Hive.box<FavouritesBookModel>(HiveBoxes.favourites);

  @override
  String addToFavourites(FavouritesBookModel book) {
    bool isExist = false;
    String message = '';

    if (favouritesBox.values.isNotEmpty) {
      for (var item in favouritesBox.values) {
        if (item.name == book.name) {
          isExist = true;
          message = 'Товар уже есть в Избранном!';
          break;
        }
      }
      if (!isExist) {
        favouritesBox.add(FavouritesBookModel(
          name: book.name,
          price: book.price,
          image: book.image,
        ));

        message = 'Товар добавлен в Избранное!';
      }
    } else {
      favouritesBox.add(FavouritesBookModel(
        name: book.name,
        price: book.price,
        image: book.image,
      ));

      message = 'Товар добавлен в Избранное!';
    }

    return message;
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
