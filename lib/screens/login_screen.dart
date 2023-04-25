import 'package:flutter/material.dart';

import 'package:restaurant_menu/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            CustomInputField(),
            CustomInputField(),
            SignInButton(),
            Text('OR', style: TextStyle(color: Colors.white, fontSize: 20)),
            SocialSignInButton()
          ],
        ),
      ),
    );
  }
}
