import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';

import '../../../../core/utils/enums/question_state.dart';
import '../../data/models/option_model.dart';

class OptionWidget extends StatelessWidget {
  const OptionWidget(
      {Key? key,
      required this.onClick,
      required this.option,
      required this.state,
      required this.selected})
      : super(key: key);
  final Function()? onClick;
  final OptionModel option;
  final QuestionState state;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        color: getColor(context),
        margin: const EdgeInsets.symmetric(vertical: 1),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              child: Text(
                option.value,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color? getColor(BuildContext context) {
    final provider = context.read<QuizViewModel>();
    final successColor = Theme.of(context).colorScheme.secondary;
    final errorColor = Theme.of(context).colorScheme.error;
    if (state == QuestionState.result) {
      if (provider.currentQuestion.type == null &&
          provider.currentQuestion.options.last.value == 'All of the above') {
        return successColor;
      }

      if (provider.getCorrectAnswers().contains(option.key)) {
        return successColor;
      }

      if (selected && provider.checkAnswer()) {
        return successColor;
      } else if (selected && !provider.checkAnswer()) {
        return errorColor;
      } else {
        return null;
      }
    } else {
      if (selected) {
        return Colors.grey;
      } else {
        return null;
      }
    }
  }
}
