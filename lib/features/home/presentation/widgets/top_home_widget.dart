import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';

class TopHomeWidget extends StatelessWidget {
  const TopHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16, bottom: 16, right: 8, left: 8),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return OutlinedButton(
              style: ButtonStyle(
                side: MaterialStateProperty.all(
                  BorderSide(
                    color: Theme.of(context).primaryColor,
                    width: 2,
                  ),
                ),
              ),
              onPressed: () => NavigationManager.instance.goCategoryPage(index),
              child: Center(
                child: Text(
                  AppConstants.category[index].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          },
          childCount: AppConstants.category.length,
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
