// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ru locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'ru';

  static String m0(sum) => "Сумма заказа: ${sum} ₽";

  static String m1(price) => "Цена: ${price} ₽";

  static String m2(sum) => "Общая сумма: ${sum} ₽";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "BBTKirovApp": MessageLookupByLibrary.simpleMessage("BBT Kirov App"),
        "aboutApp": MessageLookupByLibrary.simpleMessage("О приложении"),
        "addToCart": MessageLookupByLibrary.simpleMessage("ДОБАВИТЬ В КОРЗИНУ"),
        "addToFavourites":
            MessageLookupByLibrary.simpleMessage("ДОБАВИТЬ В ИЗБРАННОЕ"),
        "allOrders": MessageLookupByLibrary.simpleMessage("Все заказы"),
        "applicationLegalese":
            MessageLookupByLibrary.simpleMessage("Sergey Ogarkov © 2023"),
        "applicationVersion": MessageLookupByLibrary.simpleMessage("1.0.0"),
        "authError": MessageLookupByLibrary.simpleMessage(
            "Возникла ошибка при авторизации."),
        "authExecute": MessageLookupByLibrary.simpleMessage(
            "Выполните авторизацию для входа в приложение!"),
        "booksNotLoaded":
            MessageLookupByLibrary.simpleMessage("Ошибка! Товары не загружены"),
        "cart": MessageLookupByLibrary.simpleMessage("Корзина"),
        "cartEmpty": MessageLookupByLibrary.simpleMessage("Ваша корзина пуста"),
        "darkTheme": MessageLookupByLibrary.simpleMessage("Темная тема"),
        "emptyFavourites":
            MessageLookupByLibrary.simpleMessage("Список избранных книг пуст"),
        "enter": MessageLookupByLibrary.simpleMessage("ВОЙТИ"),
        "error": MessageLookupByLibrary.simpleMessage("Ошибка!"),
        "exit": MessageLookupByLibrary.simpleMessage("Выход"),
        "favourites": MessageLookupByLibrary.simpleMessage("Избранное"),
        "inputEmail":
            MessageLookupByLibrary.simpleMessage("Введите email (логин)"),
        "inputPassword": MessageLookupByLibrary.simpleMessage("Введите пароль"),
        "lightTheme": MessageLookupByLibrary.simpleMessage("Светлая тема"),
        "login": MessageLookupByLibrary.simpleMessage("Логин"),
        "main": MessageLookupByLibrary.simpleMessage("Главная"),
        "myOrders": MessageLookupByLibrary.simpleMessage("Мои заказы"),
        "ok": MessageLookupByLibrary.simpleMessage("OK"),
        "orderDate": MessageLookupByLibrary.simpleMessage("Дата заказа: "),
        "orderFrom": MessageLookupByLibrary.simpleMessage("Заказ от "),
        "orderStructure": MessageLookupByLibrary.simpleMessage("Состав заказа"),
        "orderSum": m0,
        "password": MessageLookupByLibrary.simpleMessage("Пароль"),
        "popularBooks":
            MessageLookupByLibrary.simpleMessage("Популярные книги"),
        "price": m1,
        "regError": MessageLookupByLibrary.simpleMessage(
            "Возникла ошибка при регистрации."),
        "registerForEnter":
            MessageLookupByLibrary.simpleMessage("Зарегистрируйтесь для входа"),
        "resultsNotFound":
            MessageLookupByLibrary.simpleMessage("Результаты не найдены"),
        "searchFromName":
            MessageLookupByLibrary.simpleMessage("Поиск по названию"),
        "sendOrder": MessageLookupByLibrary.simpleMessage("ОТПРАВИТЬ ЗАКАЗ"),
        "signUp": MessageLookupByLibrary.simpleMessage("ЗАРЕГИСТРИРОВАТЬСЯ"),
        "successfully": MessageLookupByLibrary.simpleMessage("Успешно!"),
        "successfullyRegister": MessageLookupByLibrary.simpleMessage(
            "Вы успешно зарегистрировались."),
        "totalSum": m2
      };
}
