import 'dart:developer';

import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_orders_remote_datasource.dart';
import 'package:bbt_kirov_app/features/data/models/order_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class OrdersRemoteDatasourceImpl extends IOrdersRemoteDatasource {

  @override
  void sendOrder(OrderEntity order) async {
    var parseObject = ParseObject("Orders")
      ..set("dateOrder", order.dateOrder)
      ..set("sumOrder", order.sumOrder)
      ..set("books", order.books)
      ..set("username", order.username);

    final ParseResponse parseResponse = await parseObject.save();

    if (parseResponse.success) {
      String objectId = (parseResponse.results!.first as ParseObject).objectId!;
      log('Object created: $objectId');
    } else {
      log('Object created with failed: ${parseResponse.error.toString()}');
    }
  }

  @override
  Future<List<OrderModel>> fetchOrders(String username) async {
    List<OrderModel> orders = [];
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('Orders'));
    parseQuery.whereEqualTo('username', username);
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (var object in apiResponse.results as List<ParseObject>) {
        orders.add(OrderModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return orders;
  }
}
