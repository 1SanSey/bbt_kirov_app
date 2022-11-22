import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_list_home_widget.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/carousel_slider_home.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/top_home_widget.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: const Text('BBT Kirov'),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: const CustomScrollView(slivers: [
          CarouselSliderHome(),
          SliverPadding(
            padding: EdgeInsets.only(top: 16, bottom: 8, right: 8, left: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Популярные книги',
                style: TextStyle(
                    color: AppColors.greyColor2,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          BooksListHome(),
          SliverPadding(
            padding: EdgeInsets.only(top: 8, right: 8, left: 8),
            sliver: SliverToBoxAdapter(
              child: Text(
                'Выберите категорию',
                style: TextStyle(
                    color: AppColors.greyColor2,
                    fontSize: 23,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          TopHomeWidget(),
        ]),
      );
    });
  }
}
