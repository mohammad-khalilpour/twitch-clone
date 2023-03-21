import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twitch_clone/src/bloc/auth/auth_bloc.dart';
import 'package:twitch_clone/src/widgets/custom_button.dart';
import 'package:twitch_clone/src/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController emailController;
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;

  @override
  void initState() {
    emailController = TextEditingController();
    usernameController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    usernameController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up screen'),
        centerTitle: false,
      ),
      body: LayoutBuilder(
        builder: (ctx, constraints) {
          final width = constraints.maxWidth;
          return Container(
            padding: EdgeInsets.only(
              left: width > 600 ? (width - 560) / 2 : 20,
              right: width > 600 ? (width - 560) / 2 : 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.16,
                  child: CustomTextField(
                    text: "Email",
                    description:
                        "You'll need to verify that you own this email account.",
                    isPassword: false,
                    isEmail: true,
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.16,
                  child: CustomTextField(
                    text: "Username",
                    description:
                        "This is how other see you on Twitch. You can always change this later.",
                    isPassword: false,
                    isEmail: false,
                    controller: usernameController,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.16,
                  child: CustomTextField(
                    text: "Password",
                    description:
                        "Strong passwords include a mix of lower case, upper case and numbers.",
                    isPassword: true,
                    isEmail: false,
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.035,
                ),
                Text(
                  'Twitch may use your phone number to call or send test messages with information regarding your account.',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxHeight * 0.018),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.035,
                ),
                Text(
                  "By clicking Sign Up, you are agreeing to Twitch's Terms of Service and are acknowledging our Privacy Notice apllies.",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: constraints.maxHeight * 0.018),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.055,
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
          );
        },
      ),
      backgroundColor: Colors.black,
    );
  }
}
