import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../layout_view.dart';
import '../../settings_provider.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String routeName = "/";

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, LayoutView.routeName);

    });
    super.initState();
  }

  Widget build(BuildContext context) {
    var vm = Provider.of<SettingsProvider>(context);

    var mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      body: Image.asset(
        vm.isDark()
            ? "assets/images/dark_splash_background.jpg"
            : "assets/images/splash_background.jpg",
        height: mediaQuery.height,
        width: mediaQuery.width,
        fit: BoxFit.cover,
      ),
    );
  }
}
