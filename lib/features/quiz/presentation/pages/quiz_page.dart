import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';
import 'package:quiz_assingments/features/quiz/presentation/widgets/question_widget.dart';

import '../../../../core/router/app_state.dart';
import '../../../../core/utils/globals/globals.dart';

class QuizPage extends StatelessWidget {
  QuizPage({Key? key}) : super(key: key);
  final QuizViewModel quizViewModel = sl();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: quizViewModel, child: const QuizPageImplement());
  }
}

class QuizPageImplement extends StatefulWidget {
  const QuizPageImplement({Key? key}) : super(key: key);

  @override
  State<QuizPageImplement> createState() => _QuizPageImplementState();
}

class _QuizPageImplementState extends State<QuizPageImplement> {
  @override
  void initState() {
    super.initState();
    context.read<QuizViewModel>().setAnsweringTimer();
    context.read<QuizViewModel>().resetAllValues();
  }

  @override
  void dispose() {
    super.dispose();
    onBackPress = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back_ios),onPressed: (){
          AppState appState=sl();
          appState.moveToBackScreen();

        },),
        title: const Text("Quiz"),
      ),
      body: Consumer<QuizViewModel>(builder: (_, provider, __) {
        return QuestionWidget(
            questionModel: provider.questions[provider.questionNo]);
      }),
    );
  }
}
