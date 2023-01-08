import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quiz_assingments/core/router/app_state.dart';
import 'package:quiz_assingments/features/dashboard/presentation/manager/dashboard_view_model.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';
import 'package:quiz_assingments/features/quiz/domain/use_cases/get_questions_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/enums/question_state.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/globals/snack_bar.dart';
import '../../../../core/widgets/modals/show_back_button_error_modal.dart';

class QuizViewModel extends ChangeNotifier {
  QuizViewModel({required this.getQuestionsUsecase});

  //usecases
  GetQuestionsUsecase getQuestionsUsecase;

  //value Notifiers
  ValueNotifier<bool> getQuestionsLoading = ValueNotifier(false);

  //Properties
  List<QuestionModel> _questions = [];
  int _questionNo = 0;
  List<String> _selectedAnswers = [];
  QuestionState questionState = QuestionState.answering;
  int totalScores = 0;
  bool isCorrect = false;

  Timer? answeringTimer;
  Timer? resultTimer;

  //getters
  List<QuestionModel> get questions => _questions;
  List<String> get selectedAnswers => _selectedAnswers;
  int get questionNo => _questionNo;
  QuestionModel get currentQuestion => _questions[questionNo];

  //usecases calls
  Future<void> getQuestionsList() async {
    getQuestionsLoading.value = true;
    var responseEither = await getQuestionsUsecase(NoParams());
    if (responseEither.isLeft()) {
      handleError(responseEither);
      getQuestionsLoading.value = false;
    } else if (responseEither.isRight()) {
      responseEither.foldRight(null, (response, previous) {
        _questions = response;
        getQuestionsLoading.value = false;
      });
    }
  }

  //properties methods

  resetAllValues() {
    _questionNo = 0;
    totalScores = 0;
    if (answeringTimer != null || answeringTimer!.isActive) {
      answeringTimer!.cancel();
    }
    if (resultTimer != null || answeringTimer!.isActive) {
      resultTimer!.cancel();
    }
  }

  setAnsweringTimer() {
    //Note: A counter can be added to show timer as well on screen
    answeringTimer = Timer(const Duration(seconds: 4), () {
      checkAnswer();
      setResultTimer();
    });
  }

  setResultTimer() {
    resultTimer = Timer(const Duration(seconds: 2), () {
      nextQuestion();
    });
  }

  selectOption(String key) {
    _selectOption(key);
  }

  bool checkAnswer() {
    isCorrect = _checkAnswer();
    if (isCorrect) {
      addToScore(currentQuestion.score);
    }
    _toggleState();
    notifyListeners();
    return isCorrect;
  }

  //To check if answer is correct or not
  bool _checkAnswer() {
    final questionModel = questions[questionNo];
    if (_selectedAnswers.isEmpty) {
      return false;
    }
    if (questionModel.type == 'single-choice') {
      //handlinng type 1
      return _selectedAnswers[0] == questionModel.correctAnswer;
    } else if (questionModel.type == 'multiple-choice') {
      //handing type 2
      final correctAnswersSet = questionModel.correctAnswer.split(',').toSet();
      final selectedAnswerSet = _selectedAnswers.toSet();

      return _setEquality(correctAnswersSet, selectedAnswerSet);
    } else {
      //handling type 3
      final correctAnswersSet = questionModel.correctAnswer.split(',').toSet();
      final selectedAnswerSet = _selectedAnswers.toSet();
      final lastKey = questionModel.options.last.key;

      if (questionModel.options.last.value == 'All of the above' &&
          (_selectedAnswers.contains(lastKey) ||
              _setEquality(correctAnswersSet, selectedAnswerSet))) {
        return true;
      }
      if (questionModel.options.last.value == 'None of the above' &&
          _selectedAnswers.length == 1 &&
          _selectedAnswers.contains(lastKey)) {
        return true;
      }
      return false;
    }
  }

  bool _setEquality(Set a, Set b) {
    return a.containsAll(b) && b.containsAll(a);
  }

  //increment scores
  addToScore(int score) {
    totalScores = totalScores + score;
  }

  ///To go to next question
  nextQuestion() {
    _emptySelectedAnswers();
    _toggleState();
    if (questionNo == 0) {
      _setBackButtonFunction();
    }
    if (questionNo < questions.length - 1) {
      _questionNo++;
      setAnsweringTimer();
    } else {
      onBackPress = null;
      DashboardViewModel dashboardViewModel = sl();
      if (dashboardViewModel.highestScore != null &&
          dashboardViewModel.highestScore!.value < totalScores) {
        dashboardViewModel.storeHighestScore(totalScores);
      }

      AppState appState = sl();
      appState.moveToBackScreen();
    }

    notifyListeners();
  }

  ///This is to show a warning when user will be on 2nd and so on question no's
  _setBackButtonFunction() {
    onBackPress = () {
      ShowBackButtonErrorModal showBackButtonErrorModal =
          ShowBackButtonErrorModal();
      showBackButtonErrorModal.show();
    };
  }

  List<String> getCorrectAnswers() {
    return questions[questionNo].correctAnswer.split(',').toList();
  }

  ///To change the state from user is answering and result state
  _toggleState() {
    if (questionState == QuestionState.answering) {
      questionState = QuestionState.result;
    } else {
      questionState = QuestionState.answering;
    }
    notifyListeners();
  }

  ///Inner implemention of selectOption method
  _selectOption(String key) {
    final questionModel = questions[questionNo];

    if (questionModel.type == 'single-choice') {
      _selectedAnswers.clear();
      _selectedAnswers.add(key);
    } else {
      if (!_selectedAnswers.contains(key)) {
        _selectedAnswers.add(key);
      } else {
        _selectedAnswers.remove(key);
      }
    }
    notifyListeners();
  }

  ///To empty selected answer
  _emptySelectedAnswers() {
    _selectedAnswers.clear();
    notifyListeners();
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
