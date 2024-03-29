import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled1/app/resources/values_manager.dart';

import '../../../../app/resources/assets_manager.dart';
import '../../../../app/resources/constats.dart';
import '../../../../app/resources/routes_manager.dart';

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
    Navigator.pushReplacementNamed(context, RoutesManager.mainMovieScreen);
  }

  @override
  void initState() {
    super.initState();
    startApp();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body:  Center(
        child: Image(
          height: AppSize.s400,
          width: 100,
          image: AssetImage(ImagesManager.splashLogoPath,
          ),
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
