import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/widgets/navbar/navbar_bloc/navbar_bloc.dart';
import 'package:bbt_kirov_app/features/cart/presentation/pages/cart_page.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/pages/favourites_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NavBarWidget extends StatelessWidget {
  final int? currentIndex;
  const NavBarWidget({super.key, this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavbarBloc, NavbarState>(
      builder: ((context, state) {
        return BottomNavigationBar(
          selectedItemColor: Colors.white,
          backgroundColor: AppColors.primaryColorLight,
          unselectedItemColor: AppColors.secondaryColorLight,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite), label: 'Избранное'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket), label: 'Корзина'),
          ],
          currentIndex: currentIndex ?? 0,
          onTap: (value) {
            BlocProvider.of<NavbarBloc>(context)
                .add(NavigateToEvent(destination: value));
            if (value == 0) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            } else if (value == 1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FavouritesPage(),
                ),
              );
            } else if (value == 2) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              );
            }
          },
        );
      }),
    );
  }
}
