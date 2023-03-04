import 'package:flutter/material.dart';
import 'package:twitch_clone/src/screens/login_screen.dart';
import 'package:twitch_clone/src/screens/signup_screen.dart';

import '../widgets/custom_button.dart';

class LandingPageScreen extends StatelessWidget {
  const LandingPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Twitch'),
      ),
      body: Container(
        color: const Color.fromRGBO(145, 71, 255, 1),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
            ),
            Image.asset('assets/pictures/twitchlogo.jpg'),
            SizedBox(
              height: height * 0.25,
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
                  width: width * 0.05,
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
      ),
    );
  }
}
