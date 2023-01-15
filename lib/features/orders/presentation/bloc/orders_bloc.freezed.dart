// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'orders_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrdersEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String username) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String username)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String username)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersEvent value) empty,
    required TResult Function(_FetchOrdersEvent value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersEvent value)? empty,
    TResult? Function(_FetchOrdersEvent value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersEvent value)? empty,
    TResult Function(_FetchOrdersEvent value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersEventCopyWith<$Res> {
  factory $OrdersEventCopyWith(
          OrdersEvent value, $Res Function(OrdersEvent) then) =
      _$OrdersEventCopyWithImpl<$Res, OrdersEvent>;
}

/// @nodoc
class _$OrdersEventCopyWithImpl<$Res, $Val extends OrdersEvent>
    implements $OrdersEventCopyWith<$Res> {
  _$OrdersEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmptyOrdersEventCopyWith<$Res> {
  factory _$$_EmptyOrdersEventCopyWith(
          _$_EmptyOrdersEvent value, $Res Function(_$_EmptyOrdersEvent) then) =
      __$$_EmptyOrdersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyOrdersEventCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$_EmptyOrdersEvent>
    implements _$$_EmptyOrdersEventCopyWith<$Res> {
  __$$_EmptyOrdersEventCopyWithImpl(
      _$_EmptyOrdersEvent _value, $Res Function(_$_EmptyOrdersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EmptyOrdersEvent extends _EmptyOrdersEvent {
  const _$_EmptyOrdersEvent() : super._();

  @override
  String toString() {
    return 'OrdersEvent.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmptyOrdersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String username) fetch,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String username)? fetch,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String username)? fetch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersEvent value) empty,
    required TResult Function(_FetchOrdersEvent value) fetch,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersEvent value)? empty,
    TResult? Function(_FetchOrdersEvent value)? fetch,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersEvent value)? empty,
    TResult Function(_FetchOrdersEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyOrdersEvent extends OrdersEvent {
  const factory _EmptyOrdersEvent() = _$_EmptyOrdersEvent;
  const _EmptyOrdersEvent._() : super._();
}

/// @nodoc
abstract class _$$_FetchOrdersEventCopyWith<$Res> {
  factory _$$_FetchOrdersEventCopyWith(
          _$_FetchOrdersEvent value, $Res Function(_$_FetchOrdersEvent) then) =
      __$$_FetchOrdersEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String username});
}

/// @nodoc
class __$$_FetchOrdersEventCopyWithImpl<$Res>
    extends _$OrdersEventCopyWithImpl<$Res, _$_FetchOrdersEvent>
    implements _$$_FetchOrdersEventCopyWith<$Res> {
  __$$_FetchOrdersEventCopyWithImpl(
      _$_FetchOrdersEvent _value, $Res Function(_$_FetchOrdersEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
  }) {
    return _then(_$_FetchOrdersEvent(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_FetchOrdersEvent extends _FetchOrdersEvent {
  const _$_FetchOrdersEvent({required this.username}) : super._();

  @override
  final String username;

  @override
  String toString() {
    return 'OrdersEvent.fetch(username: $username)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FetchOrdersEvent &&
            (identical(other.username, username) ||
                other.username == username));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchOrdersEventCopyWith<_$_FetchOrdersEvent> get copyWith =>
      __$$_FetchOrdersEventCopyWithImpl<_$_FetchOrdersEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function(String username) fetch,
  }) {
    return fetch(username);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function(String username)? fetch,
  }) {
    return fetch?.call(username);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function(String username)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(username);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersEvent value) empty,
    required TResult Function(_FetchOrdersEvent value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersEvent value)? empty,
    TResult? Function(_FetchOrdersEvent value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersEvent value)? empty,
    TResult Function(_FetchOrdersEvent value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _FetchOrdersEvent extends OrdersEvent {
  const factory _FetchOrdersEvent({required final String username}) =
      _$_FetchOrdersEvent;
  const _FetchOrdersEvent._() : super._();

  String get username;
  @JsonKey(ignore: true)
  _$$_FetchOrdersEventCopyWith<_$_FetchOrdersEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$OrdersState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersStateCopyWith<$Res> {
  factory $OrdersStateCopyWith(
          OrdersState value, $Res Function(OrdersState) then) =
      _$OrdersStateCopyWithImpl<$Res, OrdersState>;
}

/// @nodoc
class _$OrdersStateCopyWithImpl<$Res, $Val extends OrdersState>
    implements $OrdersStateCopyWith<$Res> {
  _$OrdersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_EmptyOrdersStateCopyWith<$Res> {
  factory _$$_EmptyOrdersStateCopyWith(
          _$_EmptyOrdersState value, $Res Function(_$_EmptyOrdersState) then) =
      __$$_EmptyOrdersStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_EmptyOrdersStateCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_EmptyOrdersState>
    implements _$$_EmptyOrdersStateCopyWith<$Res> {
  __$$_EmptyOrdersStateCopyWithImpl(
      _$_EmptyOrdersState _value, $Res Function(_$_EmptyOrdersState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_EmptyOrdersState extends _EmptyOrdersState {
  const _$_EmptyOrdersState() : super._();

  @override
  String toString() {
    return 'OrdersState.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_EmptyOrdersState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _EmptyOrdersState extends OrdersState {
  const factory _EmptyOrdersState() = _$_EmptyOrdersState;
  const _EmptyOrdersState._() : super._();
}

/// @nodoc
abstract class _$$_LoadingOrdersEventCopyWith<$Res> {
  factory _$$_LoadingOrdersEventCopyWith(_$_LoadingOrdersEvent value,
          $Res Function(_$_LoadingOrdersEvent) then) =
      __$$_LoadingOrdersEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingOrdersEventCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_LoadingOrdersEvent>
    implements _$$_LoadingOrdersEventCopyWith<$Res> {
  __$$_LoadingOrdersEventCopyWithImpl(
      _$_LoadingOrdersEvent _value, $Res Function(_$_LoadingOrdersEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_LoadingOrdersEvent extends _LoadingOrdersEvent {
  const _$_LoadingOrdersEvent() : super._();

  @override
  String toString() {
    return 'OrdersState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_LoadingOrdersEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _LoadingOrdersEvent extends OrdersState {
  const factory _LoadingOrdersEvent() = _$_LoadingOrdersEvent;
  const _LoadingOrdersEvent._() : super._();
}

/// @nodoc
abstract class _$$_LoadedOrdersStateCopyWith<$Res> {
  factory _$$_LoadedOrdersStateCopyWith(_$_LoadedOrdersState value,
          $Res Function(_$_LoadedOrdersState) then) =
      __$$_LoadedOrdersStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderEntity> orders});
}

/// @nodoc
class __$$_LoadedOrdersStateCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_LoadedOrdersState>
    implements _$$_LoadedOrdersStateCopyWith<$Res> {
  __$$_LoadedOrdersStateCopyWithImpl(
      _$_LoadedOrdersState _value, $Res Function(_$_LoadedOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$_LoadedOrdersState(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderEntity>,
    ));
  }
}

/// @nodoc

class _$_LoadedOrdersState extends _LoadedOrdersState {
  const _$_LoadedOrdersState({required final List<OrderEntity> orders})
      : _orders = orders,
        super._();

  final List<OrderEntity> _orders;
  @override
  List<OrderEntity> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrdersState.loaded(orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedOrdersState &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedOrdersStateCopyWith<_$_LoadedOrdersState> get copyWith =>
      __$$_LoadedOrdersStateCopyWithImpl<_$_LoadedOrdersState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) {
    return loaded(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) {
    return loaded?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _LoadedOrdersState extends OrdersState {
  const factory _LoadedOrdersState({required final List<OrderEntity> orders}) =
      _$_LoadedOrdersState;
  const _LoadedOrdersState._() : super._();

  List<OrderEntity> get orders;
  @JsonKey(ignore: true)
  _$$_LoadedOrdersStateCopyWith<_$_LoadedOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LoadedAllOrdersStateCopyWith<$Res> {
  factory _$$_LoadedAllOrdersStateCopyWith(_$_LoadedAllOrdersState value,
          $Res Function(_$_LoadedAllOrdersState) then) =
      __$$_LoadedAllOrdersStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<OrderEntity> orders});
}

/// @nodoc
class __$$_LoadedAllOrdersStateCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_LoadedAllOrdersState>
    implements _$$_LoadedAllOrdersStateCopyWith<$Res> {
  __$$_LoadedAllOrdersStateCopyWithImpl(_$_LoadedAllOrdersState _value,
      $Res Function(_$_LoadedAllOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orders = null,
  }) {
    return _then(_$_LoadedAllOrdersState(
      orders: null == orders
          ? _value._orders
          : orders // ignore: cast_nullable_to_non_nullable
              as List<OrderEntity>,
    ));
  }
}

/// @nodoc

class _$_LoadedAllOrdersState extends _LoadedAllOrdersState {
  const _$_LoadedAllOrdersState({required final List<OrderEntity> orders})
      : _orders = orders,
        super._();

  final List<OrderEntity> _orders;
  @override
  List<OrderEntity> get orders {
    if (_orders is EqualUnmodifiableListView) return _orders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_orders);
  }

  @override
  String toString() {
    return 'OrdersState.loadedAll(orders: $orders)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadedAllOrdersState &&
            const DeepCollectionEquality().equals(other._orders, _orders));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_orders));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadedAllOrdersStateCopyWith<_$_LoadedAllOrdersState> get copyWith =>
      __$$_LoadedAllOrdersStateCopyWithImpl<_$_LoadedAllOrdersState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) {
    return loadedAll(orders);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) {
    return loadedAll?.call(orders);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loadedAll != null) {
      return loadedAll(orders);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) {
    return loadedAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) {
    return loadedAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) {
    if (loadedAll != null) {
      return loadedAll(this);
    }
    return orElse();
  }
}

abstract class _LoadedAllOrdersState extends OrdersState {
  const factory _LoadedAllOrdersState(
      {required final List<OrderEntity> orders}) = _$_LoadedAllOrdersState;
  const _LoadedAllOrdersState._() : super._();

  List<OrderEntity> get orders;
  @JsonKey(ignore: true)
  _$$_LoadedAllOrdersStateCopyWith<_$_LoadedAllOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ErrorOrdersStateCopyWith<$Res> {
  factory _$$_ErrorOrdersStateCopyWith(
          _$_ErrorOrdersState value, $Res Function(_$_ErrorOrdersState) then) =
      __$$_ErrorOrdersStateCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorOrdersStateCopyWithImpl<$Res>
    extends _$OrdersStateCopyWithImpl<$Res, _$_ErrorOrdersState>
    implements _$$_ErrorOrdersStateCopyWith<$Res> {
  __$$_ErrorOrdersStateCopyWithImpl(
      _$_ErrorOrdersState _value, $Res Function(_$_ErrorOrdersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_ErrorOrdersState(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ErrorOrdersState extends _ErrorOrdersState {
  const _$_ErrorOrdersState(
      {this.message = 'Произошла ошибка загрузки заказов'})
      : super._();

  @override
  @JsonKey()
  final String message;

  @override
  String toString() {
    return 'OrdersState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ErrorOrdersState &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorOrdersStateCopyWith<_$_ErrorOrdersState> get copyWith =>
      __$$_ErrorOrdersStateCopyWithImpl<_$_ErrorOrdersState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() empty,
    required TResult Function() loading,
    required TResult Function(List<OrderEntity> orders) loaded,
    required TResult Function(List<OrderEntity> orders) loadedAll,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? empty,
    TResult? Function()? loading,
    TResult? Function(List<OrderEntity> orders)? loaded,
    TResult? Function(List<OrderEntity> orders)? loadedAll,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? empty,
    TResult Function()? loading,
    TResult Function(List<OrderEntity> orders)? loaded,
    TResult Function(List<OrderEntity> orders)? loadedAll,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EmptyOrdersState value) empty,
    required TResult Function(_LoadingOrdersEvent value) loading,
    required TResult Function(_LoadedOrdersState value) loaded,
    required TResult Function(_LoadedAllOrdersState value) loadedAll,
    required TResult Function(_ErrorOrdersState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EmptyOrdersState value)? empty,
    TResult? Function(_LoadingOrdersEvent value)? loading,
    TResult? Function(_LoadedOrdersState value)? loaded,
    TResult? Function(_LoadedAllOrdersState value)? loadedAll,
    TResult? Function(_ErrorOrdersState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EmptyOrdersState value)? empty,
    TResult Function(_LoadingOrdersEvent value)? loading,
    TResult Function(_LoadedOrdersState value)? loaded,
    TResult Function(_LoadedAllOrdersState value)? loadedAll,
    TResult Function(_ErrorOrdersState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorOrdersState extends OrdersState {
  const factory _ErrorOrdersState({final String message}) = _$_ErrorOrdersState;
  const _ErrorOrdersState._() : super._();

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorOrdersStateCopyWith<_$_ErrorOrdersState> get copyWith =>
      throw _privateConstructorUsedError;
}
