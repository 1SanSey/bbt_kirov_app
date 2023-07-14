import 'package:bbt_kirov_app/core/assets/app_const.dart';
import 'package:bbt_kirov_app/core/themes/app_colors.dart';
import 'package:bbt_kirov_app/features/authentication/presentation/reg_bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  final controllerUsername = TextEditingController();
  final controllerPassword = TextEditingController();

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
          body: BlocListener<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              state.mapOrNull(
                error: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Ошибка!"),
                        content: const Text('Возникла ошибка при регистрации.'),
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
                successful: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Успешно!"),
                        content: const Text('Вы успешно зарегистрировались.'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text(
                              "OK",
                              style: TextStyle(color: AppColors.primaryColorLight),
                            ),
                            onPressed: () {
                              Navigator.of(context)
                                ..pop()
                                ..pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
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
                      child: Text('Зарегистрируйтесь для входа',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
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
                        labelText: 'Ваш email (логин)',
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
                      //enabled: !isLoggedIn,
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.none,
                      autocorrect: false,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Введите пароль',
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
                    // const SizedBox(
                    //   height: 8,
                    // ),
                    // TextField(
                    //   cursorColor: AppColors.primaryColorLight,
                    //   controller: controllerPassword,
                    //   //enabled: !isLoggedIn,
                    //   obscureText: true,
                    //   keyboardType: TextInputType.text,
                    //   textCapitalization: TextCapitalization.none,
                    //   autocorrect: false,
                    //   textInputAction: TextInputAction.search,
                    //   decoration: InputDecoration(
                    //     filled: true,
                    //     labelText: 'Подтвердите пароль',
                    //     labelStyle: const TextStyle(color: AppColors.primaryColorLight),
                    //     fillColor: AppColors.greyColor,
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: const BorderSide(
                    //         color: AppColors.greyColor,
                    //         width: 1.0,
                    //       ),
                    //     ),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(12),
                    //       borderSide: const BorderSide(
                    //         color: AppColors.primaryColorLight,
                    //         width: 1.0,
                    //       ),
                    //     ),
                    //   ),
                    // ),
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
                              .read<RegistrationBloc>()
                              .add(RegistrationEvent.register(login: login, password: password));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            fixedSize: const Size(320, 50),
                            textStyle: const TextStyle(color: Colors.white, fontSize: 18),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                        child: const Text('ЗАРЕГИСТРИРОВАТЬСЯ'),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    controllerUsername.dispose();
    controllerPassword.dispose();
    super.dispose();
  }
}
