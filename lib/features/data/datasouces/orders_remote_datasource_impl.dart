import 'dart:developer';

import 'package:bbt_kirov_app/core/error/exception.dart';
import 'package:bbt_kirov_app/features/data/i_datasources/i_orders_remote_datasource.dart';
import 'package:bbt_kirov_app/features/data/models/order_model.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class OrdersRemoteDatasourceImpl extends IOrdersRemoteDatasource {
  @override
  Future<String> sendOrder(OrderEntity order) async {
    final parseObject = ParseObject('Orders')
      ..set('dateOrder', order.dateOrder)
      ..set('sumOrder', order.sumOrder)
      ..set('books', order.books)
      ..set('user', (ParseObject('_User')..objectId = order.userId).toPointer());

    final ParseResponse parseResponse = await parseObject.save();

    if (parseResponse.success) {
      final objectId = (parseResponse.results!.first as ParseObject).objectId!;
      log('Object created: $objectId');

      return objectId;
    } else {
      log('Object created with failed: ${parseResponse.error}');
      throw ServerException();
    }
  }

  @override
  Future<List<OrderModel>> fetchOrders(String userId) async {
    log('fetchOrders');
    final orders = <OrderModel>[];
    final QueryBuilder<ParseObject> parseQuery = QueryBuilder<ParseObject>(ParseObject('Orders'))
      ..whereEqualTo('user', (ParseObject('_User')..objectId = userId).toPointer());
    final apiResponse = await parseQuery.query();

    if (apiResponse.success && apiResponse.results != null) {
      for (final object in apiResponse.results as List<ParseObject>) {
        log('Object: $object');
        orders.add(OrderModel.fromDb(object));
      }
    } else {
      throw ServerException();
    }

    return orders;
  }
}
