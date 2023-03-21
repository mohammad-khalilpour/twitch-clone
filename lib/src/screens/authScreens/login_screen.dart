import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitch_clone/src/bloc/auth/auth_bloc.dart';
import 'package:twitch_clone/src/widgets/custom_button.dart';
import 'package:twitch_clone/src/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In Screen'),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          return Container(
            padding: EdgeInsets.only(
              left: width > 600 ? (width - 560) / 2 : 20,
              right: width > 600 ? (width - 560) / 2 : 20,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.16,
                  child: CustomTextField(
                    text: "Email",
                    description: "",
                    isPassword: false,
                    isEmail: true,
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.16,
                  child: CustomTextField(
                    text: "password",
                    description: "",
                    isPassword: true,
                    isEmail: false,
                    controller: passwordController,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Trouble logging in?",
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
                const SizedBox(
                  height: 5,
                ),
                Center(
                  child: CustomButton(
                    text: 'Log In',
                    onPressed: () {
                      context.read<AuthBloc>().add(
                            AppEventLogIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            ),
                          );
                    },
                    color: const Color.fromARGB(70, 118, 110, 110),
                    textColor: Colors.white70,
                    buttonWidth: 1,
                  ),
                ),
              ],
            ),
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
