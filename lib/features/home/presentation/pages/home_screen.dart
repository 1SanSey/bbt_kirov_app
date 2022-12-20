import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/drawer_widget.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/features/cart/presentation/pages/cart_page.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/pages/favourites_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('BBT Kirov'),
            centerTitle: true,
            actions: [iconSwitchTheme(context, themeNotifier)],
          ),
          body: const TabBarView(
            children: <Widget>[
              MainScreen(),
              FavouritesPage(),
              CartPage(),
            ],
          ),
          bottomNavigationBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 50),
            child: const Material(
              color: AppColors.primaryColorLight,
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: AppColors.secondaryColorLight,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: AppColors.primaryColorLight,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.home),
                    iconMargin: EdgeInsets.only(top: 3, bottom: 3),
                    text: 'Главная',
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.favorite),
                    iconMargin: EdgeInsets.only(top: 3, bottom: 3),
                    text: 'Избранное',
                    height: 50,
                  ),
                  Tab(
                    icon: Icon(Icons.shopping_basket),
                    iconMargin: EdgeInsets.only(top: 3, bottom: 3),
                    text: 'Корзина',
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
          /* const NavBarWidget(
            currentIndex: 0,
          ), */
          drawer: const DrawerWidget(),
        ),
      );
    });
  }
}
