import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/core/modals/no_params.dart';
import 'package:quiz_assingments/core/utils/network/network_info.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';
import 'package:quiz_assingments/features/splash/domain/repository/splash_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../data_sources/splash_remote_data_souce.dart';

class SplashRepoImp implements SplashRepository {

  NetworkInfo networkInfo;
  SplashRemoteDataSource remoteDataSource;
  SplashRepoImp({required this.networkInfo, required this.remoteDataSource});


  @override
  Future<Either<Failure, GetCustomThemeResponseModel>> getCustomTheme(
      NoParams params) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure(AppMessages.noInternet));
    }
    try {
      return Right(await remoteDataSource.getCustomTheme(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

}
