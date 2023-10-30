import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/orders/domain/entities/order_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderDetailPage extends StatelessWidget {
  final OrderEntity order;
  const OrderDetailPage({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.maybePop(context);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text('Состав заказа'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
                title: Text(
              'Дата заказа: ${getDMYDate(order.dateOrder)}${getHmDate(order.dateOrder)}',
              style: const TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 22, color: AppColors.greyColor2),
            )),
            const SizedBox(
              height: 5,
            ),
            ListTile(
                title: Text(
              'Сумма заказа: ${order.sumOrder} руб.',
              style: const TextStyle(
                  fontWeight: FontWeight.w400, fontSize: 22, color: AppColors.greyColor2),
            )),
            const SizedBox(
              height: 5,
            ),
            const ListTile(
                title: Text(
              'Состав заказа:',
              style:
                  TextStyle(fontWeight: FontWeight.w400, fontSize: 22, color: AppColors.greyColor2),
            )),
            ...getBooksOrder(context),
          ],
        ),
      ),
    );
  }

  List<Widget> getBooksOrder(BuildContext context) {
    List<Widget> listBooks = [];
    for (var item in order.books.entries) {
      listBooks.add(Divider(
        color: Theme.of(context).primaryColorDark,
        thickness: 1,
      ));
      listBooks.add(ListTile(
          title: Text(
            item.key,
            style: const TextStyle(color: AppColors.greyColor2),
          ),
          trailing: Text(item.value.toString())));
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
