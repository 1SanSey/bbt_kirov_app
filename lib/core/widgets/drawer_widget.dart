import 'dart:developer';

import 'package:bbt_kirov_app/features/authentication/data/logged_in_model.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    LoggedInModel isLoggedIn = LoggedInModel();
    return Drawer(
      backgroundColor: Colors.white,
      width: MediaQuery.of(context).size.width * 0.80,
      child: BlocBuilder<AuthBLoC, AuthState>(
        builder: (context, state) {
          String? userName = 'UserName';
          String? userPhoto = 'https://master-kraski.ru/images/no-image.jpg';
          String? userEmail = 'user@email.com';
          state.maybeMap(
            orElse: () {
              log('orElse');
            },
            authenticated: (state) {
              userName = state.user.displayName;
              userPhoto = state.user.photoURL;
              userEmail = state.user.email;
            },
            notAuthenticated: (state) {
              log('notauthenticated');
            },
          );
          return ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                ),
                accountName: Text(
                  userName!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 24),
                ),
                accountEmail: Text(
                  userEmail!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                currentAccountPicture: ClipRRect(
                  borderRadius: BorderRadius.circular(50.0),
                  child: Image.network(
                    userPhoto!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(
                  Icons.home,
                ),
                title: const Text('Главная'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Icon(
                  Icons.list_alt,
                ),
                title: const Text('Мои заказы'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const AboutListTile(
                icon: Icon(
                  Icons.info,
                ),
                applicationIcon: Icon(
                  Icons.local_play,
                ),
                applicationName: 'BBT Kirov App',
                applicationVersion: '1.0.0',
                applicationLegalese: 'Sanatana-Rupa dasa © 2023',
                aboutBoxChildren: [],
                child: Text('О приложении'),
              ),
              ListTile(
                leading: const Icon(
                  Icons.exit_to_app,
                ),
                title: const Text('Выход'),
                onTap: () {
                  context.read<AuthBLoC>().add(const AuthEvent.logOut());
                  isLoggedIn.isLoggedIn = false;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AuthPage(),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
