import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/core/themes/change_theme_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  // late SharedPreferences _userPrefs;
  // late bool _userLoggedIn;
  // String _userName = 'userName';
  // String _userPhoto = 'https://master-kraski.ru/images/no-image.jpg';
  // String _userEmail = 'userEmail';

  @override
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() => _userPrefs = prefs);
    //   _loadUserPrefs();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeThemeBloc, ThemeState>(
      builder: (context, state) {
        return Drawer(
          backgroundColor: Theme.of(context).primaryColor,
          width: MediaQuery.of(context).size.width * 0.80,
          child: Column(
            children: [
              BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    accountName: Text(
                      state.user.displayName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    accountEmail: Text(
                      state.user.email,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    currentAccountPicture: state.user.photoURL.isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50.0),
                            child: Image.network(
                              state.user.photoURL,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50.0), color: Colors.white),
                          ),
                  );
                },
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: const Text(
                          'Главная',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () => NavigationManager.instance.goHomePage(),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.list_alt,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: const Text(
                          'Мои заказы',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () => NavigationManager.instance.goOrdersPage(),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.exit_to_app,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: const Text(
                          'Выход',
                          style: TextStyle(fontSize: 18),
                        ),
                        onTap: () {
                          context.read<AuthBloc>().add(const AuthEvent.logOut());
                          // _setUserPrefs(false, '', '', '');
                          NavigationManager.instance.goAuthPage();
                        },
                      ),
                      const SizedBox(height: 60),
                      const Divider(
                        color: AppColors.greyColor,
                        thickness: 1,
                      ),
                      AboutListTile(
                        icon: Icon(
                          Icons.info_outline,
                          color: Theme.of(context).primaryColor,
                        ),
                        applicationIcon: const Icon(
                          Icons.local_play,
                        ),
                        applicationName: 'BBT Kirov App',
                        applicationVersion: '1.0.0',
                        applicationLegalese: 'Sergey Ogarkov © 2023',
                        aboutBoxChildren: const [],
                        child: const Text(
                          'О приложении',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      ListTile(
                          leading: Icon(
                            state.isDark ? Icons.nightlight_round : Icons.wb_sunny,
                            color: Theme.of(context).primaryColor,
                          ),
                          title: Text(
                            state.isDark ? 'Тёмная тема' : 'Светлая тема',
                            style: const TextStyle(fontSize: 15),
                          ),
                          onTap: () =>
                              context.read<ChangeThemeBloc>().add(const ThemeEvent.change())),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  // void _loadUserPrefs() {
  //   setState(() {
  //     _userLoggedIn = _userPrefs.getBool(AppConstants.loggedInPref) ?? false;
  //     _userName = _userPrefs.getString(AppConstants.usernamePref) ?? '';
  //     _userPhoto = _userPrefs.getString(AppConstants.photoPref) ?? '';
  //     _userEmail = _userPrefs.getString(AppConstants.emailPref) ?? '';
  //   });
  // }

  // Future<void> _setUserPrefs(bool loggedIn, String username, String email, String photo) async {
  //   await _userPrefs.setBool(AppConstants.loggedInPref, loggedIn);
  //   await _userPrefs.setString(AppConstants.usernamePref, username);
  //   await _userPrefs.setString(AppConstants.photoPref, photo);
  //   await _userPrefs.setString(AppConstants.emailPref, email);
  // }
}
