import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/drawer_widget.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/core/widgets/nav_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('BBT Kirov'),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: const CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Center(
              child: Text(
                'Избанное',
                style: TextStyle(
                    color: AppColors.greyColor2,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ]),
        bottomNavigationBar: const NavBarWidget(
          currentIndex: 1,
        ),
        drawer: const DrawerWidget(),
      );
    });
  }
}
