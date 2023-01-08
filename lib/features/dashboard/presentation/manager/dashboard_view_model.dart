import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:quiz_assingments/features/dashboard/data/models/highest_score_model.dart';
import 'package:quiz_assingments/features/dashboard/domain/use_cases/get_highest_score_usecase.dart';
import 'package:quiz_assingments/features/dashboard/domain/use_cases/store_highest_score_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/globals/snack_bar.dart';

class DashboardViewModel extends ChangeNotifier {
  DashboardViewModel(
      {required this.storeHighestScoreUsecase,
      required this.getHighestScoreUsecase});

  //usecases
  final GetHighestScoreUsecase getHighestScoreUsecase;
  final StoreHighestScoreUsecase storeHighestScoreUsecase;

  //properties
  HighestScoreModel? _highestScore;

  //Value notifiers
  ValueNotifier<bool> highestScoreLoading = ValueNotifier(false);

  //getters
  HighestScoreModel? get highestScore => _highestScore;

  //usecases calls

  Future<void> getHighestScore() async {
    highestScoreLoading.value = true;
    var responseEither = await getHighestScoreUsecase(NoParams());
    if (responseEither.isLeft()) {
      //do nothing
      highestScoreLoading.value = false;
    } else if (responseEither.isRight()) {
      responseEither.foldRight(null, (response, previous) {
        highestScoreLoading.value = false;
        _highestScore = response;
      });
    }
  }

  Future<void> storeHighestScore(int score) async {
    highestScoreLoading.value = true;

    final params = HighestScoreModel(score);

    var responseEither = await storeHighestScoreUsecase(params);
    if (responseEither.isLeft()) {
      //do nothing
      handleError(responseEither);
      highestScoreLoading.value = false;
    } else if (responseEither.isRight()) {
      responseEither.foldRight(null, (response, previous) {
        highestScoreLoading.value = false;
        _highestScore = response;
      });
    }
  }

  //ERROR handling

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
