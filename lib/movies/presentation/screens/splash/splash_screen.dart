import 'dart:async';

import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/constats.dart';
import '../../resources/routes_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  startApp() {
    timer = Timer(
        const Duration(
          seconds: AppConstants.splashTimer,
        ), () {
      goNext();
    });
  }

  goNext() {
    Navigator.pushReplacementNamed(context, RoutesManager.onBoardingScreen);
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryColor,
      body: const Center(
        child: Image(
          image: AssetImage(ImagesManager.splashLogoPath),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}
