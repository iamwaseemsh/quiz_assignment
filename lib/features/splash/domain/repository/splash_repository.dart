import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';

abstract class SplashRepository{
  Future<Either<Failure, GetCustomThemeResponseModel>> getCustomTheme(NoParams params);


}