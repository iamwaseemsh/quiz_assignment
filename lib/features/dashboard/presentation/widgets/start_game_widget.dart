import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/core/router/app_state.dart';
import 'package:quiz_assingments/core/router/models/page_config.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';

import '../../../../core/utils/globals/globals.dart';
import '../../../../core/widgets/custom/continue_button.dart';

class StartGameWidget extends StatelessWidget {
  const StartGameWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: context.read<QuizViewModel>().getQuestionsLoading,
        builder: (_, loading, __) {
          return loading
              ? const Center(
                  child: CircularProgressIndicator.adaptive(),
                )
              : context.read<QuizViewModel>().questions.isEmpty
                  ? const Center(
                      child: Text(
                          "No questions available"), // Here a reload button can be provided
                    )
                  : Center(
                      child: ContinueButton(
                          text: 'Start new game',
                          onPressed: () {
                            AppState appState = sl();
                            appState.goToNext(PageConfigs.quizPageConfig);
                          }));
        });
  }
}
