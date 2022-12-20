import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Корзина',
            style: TextStyle(
                color: AppColors.greyColor2,
                fontSize: 23,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    ]);
  }
}
