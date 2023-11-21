import 'package:bbt_kirov_app/core/app_constants.dart';
import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:bbt_kirov_app/features/presentation/bloc/reg_bloc/registration_bloc.dart';
import 'package:bbt_kirov_app/features/presentation/ui/authentication/presentation/widgets/auth_text_field.dart';
import 'package:bbt_kirov_app/generated/l10n.dart';
import 'package:bbt_kirov_app/features/presentation/navigation/navigation_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  RegistrationPageState createState() => RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  late final TextEditingController controllerUsername;
  late final TextEditingController controllerPassword;
  late final FocusNode focusNodeUsername;
  late final FocusNode focusNodePassword;

  @override
  void initState() {
    controllerUsername = TextEditingController();
    controllerPassword = TextEditingController();
    focusNodeUsername = FocusNode();
    focusNodePassword = FocusNode();
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
          body: BlocListener<RegistrationBloc, RegistrationState>(
            listener: (context, state) {
              state.mapOrNull(
                error: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(S.current.error),
                        content: Text(S.current.regError),
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
                successful: (state) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text(S.current.successfully),
                        content: Text(S.current.successfullyRegister),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                              S.current.ok,
                              style: const TextStyle(color: AppColors.primaryColorLight),
                            ),
                            onPressed: () {
                              NavigationManager.instance
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
                    Center(
                      child: Text(S.current.registerForEnter,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    AuthTextField(
                        controller: controllerUsername,
                        focusNode: focusNodeUsername,
                        labelText: S.current.inputEmail),
                    const SizedBox(
                      height: 8,
                    ),
                    AuthTextField(
                        controller: controllerPassword,
                        focusNode: focusNodePassword,
                        labelText: S.current.inputPassword),
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
                        child: Text(S.current.signUp),
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
    focusNodeUsername.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }
}
