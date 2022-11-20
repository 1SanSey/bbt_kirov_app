import 'package:bbt_kirov_app/core/themes/theme_model.dart';
import 'package:bbt_kirov_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/book_list_home_widget.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/carousel_slider_home.dart';
import 'package:bbt_kirov_app/features/home/presentation/widgets/top_home_widget.dart';
import 'package:bbt_kirov_app/locator_service.dart' as di;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          title: const Text(
              /* themeNotifier.isDark ? "Dark Mode" : "Light Mode" */ 'BBT Kirov'),
          centerTitle: true,
          actions: [
            IconButton(
                icon: Icon(themeNotifier.isDark
                    ? Icons.nightlight_round
                    : Icons.wb_sunny),
                onPressed: () {
                  themeNotifier.isDark
                      ? themeNotifier.isDark = false
                      : themeNotifier.isDark = true;
                })
          ],
        ),
        body: CustomScrollView(slivers: [
          CarouselSliderHome(),
          const TopHomeWidget(),
          BlocProvider<HomeBooksBloc>(
              create: (context) => di.sl<HomeBooksBloc>(),
              child: const BooksListHome()),
        ]),
      );
    });
  }
}
