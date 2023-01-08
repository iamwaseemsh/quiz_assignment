import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/features/dashboard/presentation/manager/dashboard_view_model.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';

import '../../../../core/utils/globals/globals.dart';
import '../manager/splash_view_model.dart';

class SplashPage extends StatelessWidget {
  SplashPage({Key? key}) : super(key: key);

  final SplashViewModel _splashViewModel = sl();
  final QuizViewModel _quizViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: _splashViewModel),
      ChangeNotifierProvider.value(value: _quizViewModel),
    ], child: const SplashPageContent());
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
    super.initState();
    //Note: We can also store theme offline and then can check if locally theme available load it from local else get it from API
    context.read<SplashViewModel>().getCustomTheme();
    context.read<QuizViewModel>().getQuestionsList();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()));
  }
}
