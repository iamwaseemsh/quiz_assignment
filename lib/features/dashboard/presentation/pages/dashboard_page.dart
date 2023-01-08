import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/core/widgets/custom/continue_button.dart';
import 'package:quiz_assingments/features/dashboard/presentation/manager/dashboard_view_model.dart';

import '../../../../core/utils/globals/globals.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);
  DashboardViewModel dashboardViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: dashboardViewModel, child: const DashboardPageContent());
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
    // TODO: implement initState
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
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (context.read<DashboardViewModel>().highestScore !=
                          null)
                        Center(
                            child: Text(
                                "Highest score: ${context.read<DashboardViewModel>().highestScore!.value}")),
                      Center(
                          child: ContinueButton(
                              text: 'Start new game', onPressed: () {}))
                    ],
                  );
          }),
    );
  }
}
