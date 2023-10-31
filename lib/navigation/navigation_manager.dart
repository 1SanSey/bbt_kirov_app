import 'package:bbt_kirov_app/core/entities/book_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/navigation/route_builder.dart';
import 'package:flutter/material.dart';

class NavigationManager {
  NavigationManager._();

  static final instance = NavigationManager._();

  final key = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => key.currentState!;

  void goRegistrationPage() {
    _navigator.pushNamed(RouteNames.registrationPage);
  }

  void goHomePage() {
    _navigator.pushReplacementNamed(RouteNames.homePage);
  }

  void goAuthPage() {
    _navigator.pushReplacementNamed(RouteNames.authPage);
  }

  void goOrdersPage() {
    _navigator.pushNamed(RouteNames.ordersPage);
  }

  void goCategoryPage(int id) {
    _navigator.pushNamed(RouteNames.categoryPage, arguments: id);
  }

  void goBookDetailPage(BookEntity book) {
    _navigator.pushNamed(RouteNames.bookDetailPage, arguments: book);
  }

  void goOrderDetailPage(OrderEntity order) {
    _navigator.pushNamed(RouteNames.orderDetailPage, arguments: order);
  }

  void popToAuthPage() {
    _navigator.popUntil(ModalRoute.withName(RouteNames.authPage));
  }

  void pop() {
    _navigator.pop();
  }
}
