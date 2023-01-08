import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/dashboard/data/data_sources/dashboard_local_data_source.dart';
import 'package:quiz_assingments/features/dashboard/data/models/highest_score_model.dart';
import 'package:quiz_assingments/features/dashboard/domain/repositories/dashboard_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/network/network_info.dart';

class DashboardRepoImp implements DashboardRepository {
  DashboardLocalDataSource localDataSource;
  DashboardRepoImp({ required this.localDataSource});

  @override
  Future<Either<Failure, HighestScoreModel>> getHighestScore(
      NoParams params) async {

    try {
      return Right(await localDataSource.getHighestScore(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

  @override
  Future<Either<Failure, HighestScoreModel>> storeHighestScore(
      HighestScoreModel params) async {

    try {
      return Right(await localDataSource.storeHighestScore(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }
}
