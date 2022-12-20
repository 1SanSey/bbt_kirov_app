import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(slivers: [
      SliverToBoxAdapter(
        child: Center(
          child: Text(
            'Избранное',
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
