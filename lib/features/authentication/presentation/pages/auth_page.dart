import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/pages/registration_page.dart';
import 'package:bbt_kirov_app/features/home/presentation/pages/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  AuthPageState createState() => AuthPageState();
}

class AuthPageState extends State<AuthPage> {
  late final TextEditingController controllerUsername;
  late final TextEditingController controllerPassword;
  late final FocusNode focusNodeUsername;
  late final FocusNode focusNodePassword;
  late SharedPreferences _userPrefs;

  @override
  void initState() {
    controllerUsername = TextEditingController();
    controllerPassword = TextEditingController();
    focusNodeUsername = FocusNode();
    focusNodePassword = FocusNode();
    SharedPreferences.getInstance().then((prefs) {
      setState(() => _userPrefs = prefs);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('BBT Kirov App'),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: BlocListener<AuthBLoC, AuthState>(
            listener: (context, state) {
              state.mapOrNull(
                error: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Ошибка!"),
                        content: const Text('Возникла ошибка авторизации.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              "OK",
                              style: TextStyle(color: AppColors.primaryColorLight),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                authenticated: (state) {
                  _setUserPrefs(
                      loggedIn: true,
                      username: state.user.displayName!,
                      email: state.user.email!,
                      photo: state.user.photoURL!);
                  Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const HomePage()));
                },
              );
            },
            child: Center(
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
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextField(
                      cursorColor: AppColors.primaryColorLight,
                      controller: controllerUsername,
                      focusNode: focusNodeUsername,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Логин',
                        labelStyle: const TextStyle(color: AppColors.primaryColorLight),
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
                      focusNode: focusNodePassword,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Пароль',
                        labelStyle: const TextStyle(color: AppColors.primaryColorLight),
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
                        onPressed: () {
                          final login = controllerUsername.text.trim();
                          final password = controllerPassword.text.trim();
                          context
                              .read<AuthBLoC>()
                              .add(AuthEvent.logIn(login: login, password: password));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            fixedSize: const Size(320, 50),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: const Text('ВОЙТИ'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => const RegistrationPage()));
                      },
                      style: OutlinedButton.styleFrom(
                          fixedSize: const Size(320, 50),
                          side: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                          foregroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'ЗАРЕГИСТРИРОВАТЬСЯ',
                        style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  Future<void> _setUserPrefs(
      {required bool loggedIn,
      required String username,
      required String email,
      required String photo}) async {
    await _userPrefs.setBool(AppConstants.loggedInPref, loggedIn);
    await _userPrefs.setString(AppConstants.usernamePref, username);
    await _userPrefs.setString(AppConstants.photoPref, photo);
    await _userPrefs.setString(AppConstants.emailPref, email);
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    focusNodeUsername.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }
}
