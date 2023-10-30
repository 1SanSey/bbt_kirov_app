import 'package:bbt_kirov_app/common/failure_to_message.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/orders/domain/usecases/orders_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

part 'orders_bloc.freezed.dart';

@freezed
class OrdersEvent with _$OrdersEvent {
  const OrdersEvent._();
  const factory OrdersEvent.empty() = _EmptyOrdersEvent;
  const factory OrdersEvent.fetch({required String username}) =
      _FetchOrdersEvent;
}

@freezed
class OrdersState with _$OrdersState {
  const OrdersState._();
  const factory OrdersState.empty() = _EmptyOrdersState;
  const factory OrdersState.loading() = _LoadingOrdersEvent;
  const factory OrdersState.loaded({required List<OrderEntity> orders}) =
      _LoadedOrdersState;
  const factory OrdersState.loadedAll({required List<OrderEntity> orders}) =
      _LoadedAllOrdersState;
  const factory OrdersState.error({
    @Default('Произошла ошибка загрузки заказов') String message,
  }) = _ErrorOrdersState;
}

class OrdersBloc extends Bloc<OrdersEvent, OrdersState> {
  final OrdersUseCase ordersUseCase;

  OrdersBloc({required this.ordersUseCase}) : super(const OrdersState.empty()) {
    on<OrdersEvent>(
      (event, emitter) => event.map<Future<void>>(
        empty: (event) => _emptyEvent(event, emitter),
        fetch: (event) => _fetchEvent(event, emitter),
      ),
      transformer: bloc_concurrency.droppable(),
    );
  }

  Future<void> _fetchEvent(
      _FetchOrdersEvent event, Emitter<OrdersState> emitter) async {
    emitter(const OrdersState.loading());
    final failureOrOrders =
        await ordersUseCase(OrdersParams(username: event.username));

    failureOrOrders.fold(
        (failure) =>
            emitter(OrdersState.error(message: mapFailureToMessage(failure))),
        (orders) {
      emitter(OrdersState.loaded(orders: orders));
    });
  }

  Future<void> _emptyEvent(
      _EmptyOrdersEvent event, Emitter<OrdersState> emitter) async {}
}
