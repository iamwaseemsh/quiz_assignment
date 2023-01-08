import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';

abstract class SplashRepository {
  /// This method gets theme data from API
  /// [Input]: [NoParams] contains nothing
  /// [Output] : if operation successful returns [GetCustomThemeResponseModel] returns app theme variables info
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, GetCustomThemeResponseModel>> getCustomTheme(
      NoParams params);
}
