import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity order;
  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: const Text('Состав заказа'),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                  title: Text(
                'Дата заказа: ${getDMYDate(order.dateOrder)}${getHmDate(order.dateOrder)}',
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              )),
              const SizedBox(
                height: 5,
              ),
              ListTile(
                  title: Text(
                'Сумма заказа: ${order.sumOrder} руб.',
                style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              )),
              const SizedBox(
                height: 5,
              ),
              const ListTile(
                  title: Text(
                'Состав заказа:',
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 22),
              )),
              ...getBooksOrder(),
            ],
          ),
        ),
      );
    });
  }

  List<Widget> getBooksOrder() {
    List<Widget> listBooks = [];
    for (var item in order.books.entries) {
      listBooks.add(const Divider(
        color: AppColors.greyColor,
        thickness: 2,
      ));
      listBooks.add(ListTile(title: Text(item.key), trailing: Text(item.value.toString())));
    }
    return listBooks;
  }

  String getHmDate(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }

  String getDMYDate(DateTime dateTime) {
    return DateFormat('dd/MM/y ').format(dateTime);
  }
}
