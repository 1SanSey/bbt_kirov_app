import 'package:bbt_kirov_app/core/hive_names.dart';
import 'package:bbt_kirov_app/features/data/models/cart_book_model/cart_book_model.dart';
import 'package:bbt_kirov_app/features/data/models/favourites_book_model/favourites_book_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class InitDatasources {
  InitDatasources._();

  static final instance = InitDatasources._();

  Future<void> initParse() async {
    await dotenv.load(fileName: 'assets/.env');
    await Parse().initialize(
      dotenv.env['KEY_APPLICATION_ID']!,
      dotenv.env['API_URI']!,
      clientKey: dotenv.env['KEY_CLIENT'],
      autoSendSessionId: true,
    );
  }

  Future<void> initHive() async {
    await Hive.initFlutter();
    Hive..registerAdapter(CartBookModelAdapter())
    ..registerAdapter(FavouritesBookModelAdapter());
    await Hive.openBox<CartBookModel>(HiveBoxes.cart);
    await Hive.openBox<FavouritesBookModel>(HiveBoxes.favourites);
  }
}
