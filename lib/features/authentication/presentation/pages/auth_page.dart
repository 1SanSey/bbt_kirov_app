import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/authentication/data/logged_in_model.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();
  LoggedInModel isLoggedIn = LoggedInModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('BBT Kirov App'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(AppConstants.bbtLogo),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Center(
                  child: Text('Выполните авторизацию для входа',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  cursorColor: AppColors.primaryColorLight,
                  controller: controllerUsername,
                  //enabled: !isLoggedIn,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Логин',
                    labelStyle:
                        const TextStyle(color: AppColors.primaryColorLight),
                    fillColor: AppColors.greyColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.greyColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColorLight,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextField(
                  cursorColor: AppColors.primaryColorLight,
                  controller: controllerPassword,
                  //enabled: !isLoggedIn,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.none,
                  autocorrect: false,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    filled: true,
                    labelText: 'Пароль',
                    labelStyle:
                        const TextStyle(color: AppColors.primaryColorLight),
                    fillColor: AppColors.greyColor,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.greyColor,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(
                        color: AppColors.primaryColorLight,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: isLoggedIn.isLoggedIn
                        ? null
                        : () => doUserLogin(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        fixedSize: const Size(320, 50),
                        textStyle:
                            const TextStyle(color: Colors.white, fontSize: 18),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Text('ВОЙТИ'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                /* SizedBox(
                  height: 50,
                  child: TextButton(
                    onPressed: !isLoggedIn ? null : () => doUserLogout(context),
                    child: const Text('Logout'),
                  ),
                ) */
              ],
            ),
          ),
        ));
  }

  void doUserLogin(BuildContext context) {
    final login = controllerUsername.text.trim();
    final password = controllerPassword.text.trim();
    context
        .read<AuthBLoC>()
        .add(AuthEvent.logIn(login: login, password: password));
    setState(() {
      isLoggedIn.isLoggedIn = true;
    });

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Успешно!"),
          content: const Text('Вы успешно авторизовались.'),
          actions: <Widget>[
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );

    /* return BlocListener<AuthBLoC, AuthState>(listener: (context, state) {
      state.maybeWhen(
        orElse: () {
          log('orElse');
        },
        authenticated: (state) {
          log('authenticated');
          /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Успешно!"),
                content: const Text('Вы успешно авторизовались.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ); */
        },
        notAuthenticated: (state) {
          log('notauthenticated');
          /* showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text("Error!"),
                content: const Text('Произошла ошибка'),
                actions: <Widget>[
                  TextButton(
                    child: const Text("OK"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          ); */
        },
      );
    }); */
  }

  void doUserLogout(BuildContext context) async {
    context.read<AuthBLoC>().add(const AuthEvent.logOut());

    setState(() {
      isLoggedIn.isLoggedIn = false;
    });
  }
}
