import 'package:bbt_kirov_app/core/widgets/drawer_widget.dart';
import 'package:bbt_kirov_app/features/cart/presentation/pages/cart_page.dart';
import 'package:bbt_kirov_app/features/favorites/presentation/pages/favourites_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/main_screen.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late final TabController tabController;
  late final List<String> titles;
  late String titleHandler;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    titles = ['BBT Kirov App', 'Избранное', 'Корзина'];
    titleHandler = titles[0];
    tabController.addListener(changeTitle);
  }

  void changeTitle() {
    setState(() {
      titleHandler = titles[tabController.index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(titleHandler),
            centerTitle: true,
          ),
          body: TabBarView(
            controller: tabController,
            children: const <Widget>[
              MainScreen(),
              FavouritesPage(),
              CartPage(),
            ],
          ),
          bottomNavigationBar: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width, 50),
            child: Material(
              color: Theme.of(context).primaryColor,
              child: TabBar(
                controller: tabController,
                labelColor: Colors.white,
                unselectedLabelColor: Theme.of(context).primaryColorLight,
                automaticIndicatorColorAdjustment: false,
                indicatorColor: Theme.of(context).primaryColor,
                tabs: const <Widget>[
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
          drawer: const DrawerWidget(),
        ),
      ),
    );
  }
}
