import 'package:bbt_kirov_app/features/category/presentation/pages/category_screen.dart';
import 'package:flutter/material.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<int, String> category = {
      0: 'ВСЕ КНИГИ',
      1: 'МАЛЕНЬКИЕ\n(< 150 стр.)',
      2: 'СРЕДНИЕ\n(150-299 стр.)',
      3: 'БОЛЬШИЕ\n(300-499 стр.)',
      4: 'МАХАБОЛЬШИЕ\n(> 500 стр.)',
      5: 'БХАГАВАД-ГИТА',
      6: 'ШРИМАД\nБХАГАВАТАМ',
      7: 'ШРИ ЧАЙТАНЬЯ\nЧАРИТАМРИТА',
      8: 'КОМПЛЕКТЫ',
      9: 'КУЛИНАРНЫЕ',
    };

    return SliverPadding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryPage(idCategory: index),
                  ),
                );
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Center(
                  child: Text(
                    category[index].toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            );
          },
          childCount: category.length,
        ),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          mainAxisExtent: 50,
        ),
      ),
    );
  }
}
