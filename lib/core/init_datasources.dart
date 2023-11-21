import 'package:bbt_kirov_app/core/hive_names.dart';
import 'package:bbt_kirov_app/features/data/models/cart_book_model/cart_book_model.dart';
import 'package:bbt_kirov_app/features/data/models/favourites_book_model/favourites_book_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class InitDatasources {
  static Future<void> initParse() async {
    const keyApplicationId = 'k3WLclQWTKe9pVcZUaottMLCvF2GrfjLe5NFlYM6';
    const keyClientKey = 'LvKi9oVL2hKWfU5e69MZCKnaBZYzuoKJG2nuXqoV';
    const keyParseServerUrl = 'https://parseapi.back4app.com';

    await Parse().initialize(keyApplicationId, keyParseServerUrl,
        clientKey: keyClientKey, autoSendSessionId: true);
  }

  static Future<void> initHive() async {
    await Hive.initFlutter();
    Hive.registerAdapter(CartBookModelAdapter());
    Hive.registerAdapter(FavouritesBookModelAdapter());
    await Hive.openBox<CartBookModel>(HiveBoxes.cart);
    await Hive.openBox<FavouritesBookModel>(HiveBoxes.favourites);
  }
}