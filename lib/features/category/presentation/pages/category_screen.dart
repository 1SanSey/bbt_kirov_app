import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/core/widgets/icon_switch_theme.dart';
import 'package:bbt_kirov_app/core/widgets/nav_bar_widget.dart';
import 'package:bbt_kirov_app/features/category/presentation/widgets/book_list_category_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final int idCategory;
  late final String query;
  late final String nameCategory;
  CategoryPage({super.key, required this.idCategory}) {
    switch (idCategory) {
      case 0:
        {
          nameCategory = 'Все книги';
          query = 'all';
          break;
        }
      case 1:
        {
          nameCategory = 'Маленькие книги';
          query = 'small';
          break;
        }
      case 2:
        {
          nameCategory = 'Средние книги';
          query = 'medium';

          break;
        }
      case 3:
        {
          nameCategory = 'Большие книги';
          query = 'big';

          break;
        }
      case 4:
        {
          nameCategory = 'Махабольшие книги';
          query = 'maha big';

          break;
        }
      case 5:
        {
          nameCategory = 'Бхагавад-гита';
          query = 'Бхагавад-гита';

          break;
        }
      case 6:
        {
          nameCategory = 'Шримад Бхагаватам';
          query = 'Шримад Бхагаватам';

          break;
        }
      case 7:
        {
          nameCategory = 'Шри Чайтанья Чаритамрита';
          query = 'Чайтанья Чаритамрита';

          break;
        }
      case 8:
        {
          nameCategory = 'Комплекты';
          query = 'set';

          break;
        }

      case 9:
        {
          nameCategory = 'Кулинарные';
          query = 'culinary';

          break;
        }
      default:
        {
          nameCategory = 'Выбранная категория';
          query = '';
          break;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeModel>(
        builder: (context, ThemeModel themeNotifier, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.maybePop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          title: Text(nameCategory),
          centerTitle: true,
          actions: [iconSwitchTheme(context, themeNotifier)],
        ),
        body: BooksCategoryWidget(
          query: query,
        ),
        bottomNavigationBar: const NavBarWidget(),
      );
    });
  }
}
