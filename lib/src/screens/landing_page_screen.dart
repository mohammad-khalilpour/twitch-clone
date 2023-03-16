import 'package:flutter/material.dart';
import 'package:twitch_clone/src/screens/authScreens/login_screen.dart';
import 'package:twitch_clone/src/screens/authScreens/signup_screen.dart';

import '../widgets/custom_button.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Twitch'),
        ),
        body: LayoutBuilder(
          builder: (ctx, constraintes) {
            return Container(
              color: const Color.fromRGBO(145, 71, 255, 1),
              child: Column(
                children: [
                  SizedBox(
                    height: constraintes.maxHeight * 0.2,
                  ),
                  Image.asset(
                    'assets/pictures/twitchlogo.jpg',
                    height: constraintes.maxHeight * 0.4,
                  ),
                  SizedBox(
                    height: constraintes.maxHeight * 0.25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: "Log In",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                        color: const Color.fromRGBO(145, 71, 255, 1),
                        textColor: Colors.white,
                        buttonWidth: 0.4,
                      ),
                      SizedBox(
                        width: constraintes.maxWidth * 0.05,
                      ),
                      CustomButton(
                        text: "Sign Up",
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
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
            );
          },
        ));
  }
}
