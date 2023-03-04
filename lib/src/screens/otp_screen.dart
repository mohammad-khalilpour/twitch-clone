import 'package:flutter/material.dart';

import 'package:twitch_clone/src/widgets/custom_button.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('otp screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'email has been sent to your email you ',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            CustomButton(
              text: 'done',
              onPressed: () {},
              color: const Color.fromARGB(70, 118, 110, 110),
              textColor: Colors.white,
              buttonWidth: 1,
            ),
            CustomButton(
              text: 'resend',
              onPressed: () {},
              color: const Color.fromARGB(70, 118, 110, 110),
              textColor: Colors.white,
              buttonWidth: 1,
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
