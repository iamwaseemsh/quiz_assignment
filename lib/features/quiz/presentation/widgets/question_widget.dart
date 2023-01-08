import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:quiz_assingments/core/widgets/custom/continue_button.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';

import '../../../../core/utils/enums/question_state.dart';
import '../../data/models/question_model.dart';
import 'option_widget.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({Key? key, required this.questionModel})
      : super(key: key);
  final QuestionModel questionModel;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuizViewModel>(builder: (context, provider, ch) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            _returnTopHeading(),
            _returnProgressIndicator(
                provider.questionNo, provider.questions.length),
            SizedBox(
              height: 10.h,
            ),
            Text(
                "Question ${provider.questionNo + 1} of ${provider.questions.length} ${(((provider.questionNo + 1) / provider.questions.length) * 100).toInt()}%"),
            _returnQuestion(
                "${provider.questionNo + 1}. ${widget.questionModel.question}"),
            if (widget.questionModel.questionImageUrl != null)
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: CachedNetworkImage(
                  imageUrl: widget.questionModel.questionImageUrl!,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ListView.builder(
              itemCount: widget.questionModel.options.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final option = widget.questionModel.options[index];
                return OptionWidget(
                  onClick: provider.questionState == QuestionState.result
                      ? null
                      : () {
                          provider.selectOption(option.key);
                        },
                  option: option,
                  state: provider.questionState,
                  selected: provider.selectedAnswers.contains(option.key),
                );
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            if (provider.questionState == QuestionState.result)
              _returnResultWidget(provider.isCorrect),
            SizedBox(
              height: 10.h,
            ),
            if (provider.questionState == QuestionState.answering)
              ContinueButton(
                  text: 'Check',
                  onPressed: () {
                    provider.answeringTimer!.cancel();
                    provider.setResultTimer();
                    provider.checkAnswer();
                  }),
            if (provider.questionState == QuestionState.result)
              ContinueButton(
                  text: 'Next',
                  onPressed: () {
                    provider.resultTimer!.cancel();

                    provider.nextQuestion();
                  }),
          ],
        ),
      );
    });
  }

  Widget _returnTopHeading() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          "EmbraceIT Quiz",
          style: Theme.of(context).textTheme.headline6,
        ));
  }

  Widget _returnProgressIndicator(int qNo, int total) {
    return LinearProgressIndicator(
      value: (qNo + 1) / total,
      color: Theme.of(context).colorScheme.secondary,
      minHeight: 8.h,
      backgroundColor: Colors.grey.withOpacity(.5),
    );
  }

  Widget _returnQuestion(String text) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ));
  }

  Widget _returnResultWidget(bool result) {
    return Text(result ? "Your answer is correct" : "Your answer is incorrect",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
            color: result
                ? Theme.of(context).primaryColor
                : Theme.of(context).colorScheme.error));
  }
}
