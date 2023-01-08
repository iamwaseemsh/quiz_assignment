import 'package:flutter/material.dart';
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SplashPageContent(),
    );
  }
}

class SplashPageContent extends StatelessWidget {
  const SplashPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Splash Screen"),
    ));
  }
}

