import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:quiz_assingments/core/modals/no_params.dart';
import 'package:quiz_assingments/core/router/app_state.dart';
import 'package:quiz_assingments/core/router/models/page_config.dart';
import 'package:quiz_assingments/core/utils/enums/page_state_enum.dart';
import 'package:quiz_assingments/core/utils/theme/app_theme.dart';
import 'package:quiz_assingments/core/utils/theme/theme_utils.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';
import 'package:quiz_assingments/features/splash/domain/use_cases/get_custom_theme_usecase.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/globals/globals.dart';
import '../../../../core/utils/globals/snack_bar.dart';

class SplashViewModel extends ChangeNotifier {
  SplashViewModel({required this.getCustomThemeUsecase});

  //usecases
  final GetCustomThemeUsecase getCustomThemeUsecase;
  //value notifiers

  //properties
  GetCustomThemeResponseModel? getCustomThemeResponseModel;

  ThemeData _themeData = ThemeData.light();

  //getters

  ThemeData get themeData => _themeData;

  //usecases calls

  Future<void> getCustomTheme() async {
    var loginEither = await getCustomThemeUsecase(NoParams());
    if (loginEither.isLeft()) {
      handleError(loginEither);
    } else if (loginEither.isRight()) {
      loginEither.foldRight(null, (response, previous) {
        getCustomThemeResponseModel = response;
        AppState appState = sl();
        _setThemeData();
        notifyListeners();
        appState.goToNext(PageConfigs.dashboardPageConfig,
            pageState: PageState.replace);
      });
    }
  }

  _setThemeData() {
    _themeData = ThemeData(
      primaryColor: ThemeUtils.getColorFromHex(
          getCustomThemeResponseModel!.colors.primary),
      errorColor: ThemeUtils.getColorFromHex(
          getCustomThemeResponseModel!.colors.onError),

      // canvasColor: ThemeUtils.getColorFromHex(
      //     getCustomThemeResponseModel!.colors.onSuccess),
    );
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
