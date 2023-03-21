import 'package:flutter/material.dart';
import 'package:twitch_clone/src/screens/authScreens/login_screen.dart';
import 'package:twitch_clone/src/screens/authScreens/signup_screen.dart';

import '../widgets/custom_button.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Twitch'),
        ),
        body: Container(
          color: const Color.fromRGBO(145, 71, 255, 1),
          child: Column(
            children: [
              SizedBox(
                height: height * 0.18,
              ),
              Image.asset(
                'assets/pictures/twitchlogo.jpg',
                height: height * 0.37,
              ),
              SizedBox(
                height: height * 0.23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    text: "Log In",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    color: const Color.fromRGBO(145, 71, 255, 1),
                    textColor: Colors.white,
                    buttonWidth: 0.4,
                  ),
                  SizedBox(
                    width: height * 0.05,
                  ),
                  CustomButton(
                    text: "Sign Up",
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                      );
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                    buttonWidth: 0.4,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
