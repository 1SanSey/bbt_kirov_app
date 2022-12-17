import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.white,
      backgroundColor: AppColors.primaryColorLight,
      unselectedItemColor: AppColors.secondaryColorLight,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Избранное'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_basket), label: 'Корзина'),
      ],
    );
  }
}
