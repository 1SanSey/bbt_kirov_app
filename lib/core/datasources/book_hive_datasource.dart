import 'dart:developer';

import 'package:bbt_kirov_app/core/assets/hive_names.dart';
import 'package:bbt_kirov_app/features/cart/data/models/cart_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class BookHiveDataSource {
  void addToCart(CartBookModel book);
  void removeFromCart(CartBookModel book, int index);
  void changeQuantityCart(int index, int value);
  List<CartBookModel> showCart();
}

class BookHiveDataSourceImpl extends BookHiveDataSource {
  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartBookModelAdapter());
    //Hive.registerAdapter(FavouritesBookModelAdapter());
    await Hive.openBox<CartBookModel>(HiveBoxes.cart);

    //var favouritesBox = await Hive.openBox(HiveBoxes.favourites);
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
  void changeQuantityCart(int index, int value) async {
    var currentItem = cartBox.getAt(index);
    currentItem?.quantity = value;
    await currentItem?.save();
    log(currentItem!.quantity.toString());
  }
}
