import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:flutter/material.dart';

Widget iconSwitchTheme(BuildContext context, ThemeModel themeNotifier) {
  return IconButton(
      icon:
          Icon(themeNotifier.isDark ? Icons.nightlight_round : Icons.wb_sunny),
      onPressed: () {
        themeNotifier.isDark
            ? themeNotifier.isDark = false
            : themeNotifier.isDark = true;
      });
}
