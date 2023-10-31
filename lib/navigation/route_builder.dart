import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/core/widgets/book_detail_widget.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/registration_page.dart';
import 'package:bbt_kirov_app/features/category/presentation/pages/category_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_page.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/orders/presentation/pages/order_detail_page.dart';
import 'package:bbt_kirov_app/features/orders/presentation/pages/orders_page.dart';
import 'package:flutter/material.dart';

abstract class RouteNames {
  const RouteNames._();

  static const authPage = '/';
  static const registrationPage = '/registration_page';
  static const homePage = '/home_page';
  static const ordersPage = '/orders_page';
  static const categoryPage = '/category_page';
  static const bookDetailPage = '/book_detail_page';
  static const orderDetailPage = '/order_detail_page';
}

abstract class RouteBuilder {
  const RouteBuilder._();

  static const initialRoute = RouteNames.authPage;
  static final routes = <String, Widget Function(BuildContext)>{
    RouteNames.homePage: (context) => const HomePage(),
    RouteNames.authPage: (context) => const AuthPage(),
    RouteNames.registrationPage: (context) => const RegistrationPage(),
    RouteNames.ordersPage: (context) => const OrdersPage(),
  };

  static Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case (RouteNames.categoryPage):
        final id = settings.arguments as int;
        return MaterialPageRoute(builder: (context) => CategoryPage(idCategory: id));
      case (RouteNames.bookDetailPage):
        final book = settings.arguments as BookEntity;
        return MaterialPageRoute(builder: (context) => BookDetailPage(book: book));
      case (RouteNames.orderDetailPage):
        final order = settings.arguments as OrderEntity;
        return MaterialPageRoute(
          builder: (context) => OrderDetailPage(order: order),
        );
      default:
        return MaterialPageRoute(
            builder: (context) => const Center(child: Text('Navigation Error')));
    }
  }
}
