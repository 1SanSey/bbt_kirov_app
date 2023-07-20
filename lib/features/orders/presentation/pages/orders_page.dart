import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/features/orders/presentation/bloc/orders_bloc.dart';
import 'package:bbt_kirov_app/features/orders/presentation/pages/order_detail_page.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<OrdersBloc>().add(const OrdersEvent.fetch(username: 'a'));
    List<OrderEntity> orders = [];

    return Consumer<ThemeModel>(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Мои заказы'),
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
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OrderDetailPage(order: orders[i]),
                              ),
                            );
                          },
                          child: Text(
                            'Заказ от ${getDMYDate(orders[i].dateOrder)}${getHmDate(orders[i].dateOrder)}',
                          ),
                        ));
                      }),
                      separatorBuilder: ((context, index) {
                        return const Divider(
                          color: AppColors.greyColor,
                          thickness: 2,
                        );
                      }),
                      itemCount: orders.length,
                    ),
                  )
                : const SizedBox.shrink();
          }),
        ),
      );
    });
  }

  String getHmDate(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String getDMYDate(DateTime dateTime) {
    return DateFormat('dd/MM/y ').format(dateTime);
  }
}
