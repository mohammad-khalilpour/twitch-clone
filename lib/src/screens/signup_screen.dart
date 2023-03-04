import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitch_clone/src/bloc/auth/auth_bloc.dart';
import 'package:twitch_clone/src/utils/utils.dart';
import 'package:twitch_clone/src/widgets/custom_button.dart';
import 'package:twitch_clone/src/widgets/custom_text_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up screen'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              text: "Email",
              description:
                  "You'll need to verify that you own this email account.",
              isPassword: false,
              isDate: false,
              isEmail: true,
              controller: emailController,
            ),
            CustomTextField(
              text: "Username",
              description:
                  "This is how other see you on Twitch. You can always change this later.",
              isPassword: false,
              isDate: false,
              isEmail: false,
              controller: usernameController,
            ),
            CustomTextField(
              text: "Password",
              description: "Strong passwords include a mix of lower caa",
              isPassword: true,
              isDate: false,
              isEmail: false,
              controller: passwordController,
            ),
            CustomTextField(
              text: "Date of Birth",
              description: "",
              isPassword: false,
              isDate: true,
              isEmail: false,
              controller: dateController,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Twitch may use your phone number to call or send test messages with information regarding your account.',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "By clicking Sign Up, you are agreeing to Twitch's Terms of Service and are acknowledging our Privacy Notice apllies.",
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: CustomButton(
                text: 'Sign Up',
                onPressed: () {
                  context.read<AuthBloc>().add(
                        AppEventRegister(
                          email: emailController.text,
                          password: passwordController.text,
                          username: usernameController.text,
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
