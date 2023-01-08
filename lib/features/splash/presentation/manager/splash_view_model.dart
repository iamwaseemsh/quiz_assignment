import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    var responseEither = await getCustomThemeUsecase(NoParams());
    if (responseEither.isLeft()) {
      handleError(responseEither);
    } else if (responseEither.isRight()) {
      responseEither.foldRight(null, (response, previous) {
        getCustomThemeResponseModel = response;
        AppState appState = sl();
        _setThemeData();

        appState.goToNext(PageConfigs.dashboardPageConfig,
            pageState: PageState.replace);
      });
    }
  }

  ///TO update the theme
  _setThemeData() {
    final _primaryColor =
        ThemeUtils.getColorFromHex(getCustomThemeResponseModel!.colors.primary);
    final _successColor = ThemeUtils.getColorFromHex(
        getCustomThemeResponseModel!.colors.onSuccess);
    final _errorColor =
        ThemeUtils.getColorFromHex(getCustomThemeResponseModel!.colors.onError);
    _themeData = ThemeData(
      primaryColor: _primaryColor,
      colorScheme: ColorScheme.fromSwatch(
        accentColor: _successColor,
        errorColor: _errorColor,
      ),
      appBarTheme: AppBarTheme(backgroundColor: _primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(


        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.disabled)) {
              return const Color(0xFF000812).withOpacity(0.7);
            } else {
              return _primaryColor;
            }
          }),

          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          shape:
              MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
        ),
      ),
    );

    notifyListeners();
  }

  // Error Handling
  void handleError(Either<Failure, dynamic> either) {
    either.fold((l) => ShowSnackBar.show(l.message), (r) => null);
  }
}
