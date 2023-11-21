import 'package:bbt_kirov_app/core/assets/app_constants.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/auth_bloc/auth_bloc.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/widgets/auth_text_field.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:bbt_kirov_app/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() => _userPrefs = prefs);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(S.current.BBTKirovApp),
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              state.mapOrNull(
                error: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(S.current.error),
                        content: Text(S.current.authError),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              S.current.ok,
                              style: const TextStyle(color: AppColors.primaryColorLight),
                            ),
                            onPressed: () => NavigationManager.instance.pop(),
                          ),
                        ],
                      );
                    },
                  );
                },
                authenticated: (state) {
                  // _setUserPrefs(
                  //     loggedIn: true,
                  //     username: state.user.displayName,
                  //     email: state.user.email,
                  //     photo: state.user.photoURL);
                  NavigationManager.instance.goHomePage();
                },
              );
            },
            builder: (context, state) {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                if (state.isAuthenticated) {
                  NavigationManager.instance.goHomePage();
                }
              });

              return Center(
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
                      Center(
                        child: Text(S.current.authExecute,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      AuthTextField(
                        labelText: S.current.login,
                        controller: controllerUsername,
                        focusNode: focusNodeUsername,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      AuthTextField(
                        labelText: S.current.password,
                        controller: controllerPassword,
                        focusNode: focusNodePassword,
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
                                .read<AuthBloc>()
                                .add(AuthEvent.logIn(login: login, password: password));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              fixedSize: const Size(320, 50),
                              textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                              shape:
                                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                          child: Text(S.current.enter),
                        ),
                      ),
                      const SizedBox(height: 20),
                      OutlinedButton(
                        onPressed: () => NavigationManager.instance.goRegistrationPage(),
                        style: OutlinedButton.styleFrom(
                            fixedSize: const Size(320, 50),
                            side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2,
                            ),
                            foregroundColor: Colors.transparent,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: Text(
                          S.current.signUp,
                          style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 18),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              );
            },
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
