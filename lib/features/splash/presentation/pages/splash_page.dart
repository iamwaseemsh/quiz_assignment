import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/utils/globals/globals.dart';
import '../manager/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final SplashViewModel _splashViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: _splashViewModel, child: SplashPageContent());
  }
}

class SplashPageContent extends StatefulWidget {
  const SplashPageContent({Key? key}) : super(key: key);

  @override
  State<SplashPageContent> createState() => _SplashPageContentState();
}

class _SplashPageContentState extends State<SplashPageContent> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<SplashViewModel>().getCustomTheme();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CircularProgressIndicator()
    ));
  }
}
