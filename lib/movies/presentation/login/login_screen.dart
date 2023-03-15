import 'package:flutter/material.dart';

import '../resources/strings_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: const [Text(AppStrings.loginScreen)],
      ),
    );
  }
}
