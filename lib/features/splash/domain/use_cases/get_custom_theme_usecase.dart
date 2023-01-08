import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/splash/data/data_sources/splash_remote_data_souce.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';
import 'package:quiz_assingments/features/splash/domain/repository/splash_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';

class GetCustomThemeUsecase extends UseCase<GetCustomThemeResponseModel, NoParams> {
  SplashRepository repository;
  GetCustomThemeUsecase(this.repository);

  @override
  Future<Either<Failure, GetCustomThemeResponseModel>> call(NoParams params) async {
    return await repository.getCustomTheme(params);
  }
}
