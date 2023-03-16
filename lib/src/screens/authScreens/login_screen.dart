import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitch_clone/src/bloc/auth/auth_bloc.dart';
import 'package:twitch_clone/src/utils/utils.dart';
import 'package:twitch_clone/src/widgets/custom_button.dart';
import 'package:twitch_clone/src/widgets/custom_text_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In screen'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              text: "Email",
              description: "",
              isPassword: false,
              isEmail: true,
              controller: emailController,
            ),
            CustomTextField(
              text: "password",
              description: "",
              isPassword: false,
              isEmail: false,
              controller: passwordController,
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
      ),
      backgroundColor: Colors.black,
    );
  }
}
