import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/core/widgets/custom/continue_button.dart';
import 'package:quiz_assingments/features/dashboard/presentation/manager/dashboard_view_model.dart';
import 'package:quiz_assingments/features/dashboard/presentation/widgets/start_game_widget.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';

import '../../../../core/utils/globals/globals.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  final DashboardViewModel _dashboardViewModel = sl();
  final QuizViewModel _quizViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider.value(value: _quizViewModel),
      ChangeNotifierProvider.value(value: _dashboardViewModel),
    ], child: const DashboardPageContent());
  }
}

class DashboardPageContent extends StatefulWidget {
  const DashboardPageContent({Key? key}) : super(key: key);

  @override
  State<DashboardPageContent> createState() => _DashboardPageContentState();
}

class _DashboardPageContentState extends State<DashboardPageContent> {
  @override
  void initState() {
    super.initState();
    context.read<DashboardViewModel>().getHighestScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: ValueListenableBuilder<bool>(
          valueListenable:
              context.read<DashboardViewModel>().highestScoreLoading,
          builder: (_, loading, __) {
            return loading
                ? const Center(
                    child: CircularProgressIndicator.adaptive(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (context.read<DashboardViewModel>().highestScore !=
                          null)
                        Center(
                            child: Text(
                                "Highest score: ${context.read<DashboardViewModel>().highestScore!.value}")),
                      const StartGameWidget()
                    ],
                  );
          }),
    );
  }
}
