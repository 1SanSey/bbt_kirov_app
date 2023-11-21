import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:bbt_kirov_app/features/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/orders_bloc/orders_bloc.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:bbt_kirov_app/features/presentation/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    //TODO: исправить
    context.read<OrdersBloc>().add(const OrdersEvent.fetch(username: 'a'));
    List<OrderEntity> orders = [];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => NavigationManager.instance.pop(), icon: const Icon(Icons.arrow_back)),
        title: Text(S.current.myOrders),
        centerTitle: true,
      ),
      body: BlocBuilder<OrdersBloc, OrdersState>(
        builder: ((context, state) {
          state.maybeMap(
            orElse: () {},
            loaded: (value) {
              orders = value.orders;
            },
          );

          return orders.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: ListView.separated(
                    itemBuilder: ((context, i) {
                      return ListTile(
                          title: GestureDetector(
                        onTap: () => NavigationManager.instance.goOrderDetailPage(orders[i]),
                        child: Text(
                          '${S.current.orderFrom} ${getDMYDate(orders[i].dateOrder)}${getHmDate(orders[i].dateOrder)}',
                          style: const TextStyle(color: AppColors.greyColor2),
                        ),
                      ));
                    }),
                    separatorBuilder: ((context, index) {
                      return Divider(
                        color: Theme.of(context).primaryColorDark,
                        thickness: 1,
                      );
                    }),
                    itemCount: orders.length,
                  ),
                )
              : const SizedBox.shrink();
        }),
      ),
    );
  }

  String getHmDate(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String getDMYDate(DateTime dateTime) {
    return DateFormat('dd/MM/y ').format(dateTime);
  }
}
