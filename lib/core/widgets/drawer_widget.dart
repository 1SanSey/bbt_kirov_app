import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/auth_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:bbt_kirov_app/features/orders/presentation/pages/orders_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late SharedPreferences _userPrefs;
  late bool _userLoggedIn;
  String _userName = 'userName';
  String _userPhoto = 'https://master-kraski.ru/images/no-image.jpg';
  String _userEmail = 'userEmail';

  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() => _userPrefs = prefs);
      _loadUserPrefs();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: Theme.of(context).primaryColor,
      width: MediaQuery.of(context).size.width * 0.80,
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            accountName: Text(
              _userName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            accountEmail: Text(
              _userEmail,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.network(
                _userPhoto,
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrdersPage(),
                ),
              );
            },
          ),
          const AboutListTile(
            icon: Icon(
              Icons.info_outline,
            ),
            applicationIcon: Icon(
              Icons.local_play,
            ),
            applicationName: 'BBT Kirov App',
            applicationVersion: '1.0.0',
            applicationLegalese: 'Sergey Ogarkov © 2023',
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
              _setUserPrefs(false, '', '', '');
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const AuthPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _loadUserPrefs() {
    setState(() {
      _userLoggedIn = _userPrefs.getBool(AppConstants.loggedInPref) ?? false;
      _userName = _userPrefs.getString(AppConstants.usernamePref) ?? '';
      _userPhoto = _userPrefs.getString(AppConstants.photoPref) ?? '';
      _userEmail = _userPrefs.getString(AppConstants.emailPref) ?? '';
    });
  }

  Future<void> _setUserPrefs(bool loggedIn, String username, String email, String photo) async {
    await _userPrefs.setBool(AppConstants.loggedInPref, loggedIn);
    await _userPrefs.setString(AppConstants.usernamePref, username);
    await _userPrefs.setString(AppConstants.photoPref, photo);
    await _userPrefs.setString(AppConstants.emailPref, email);
  }
}
