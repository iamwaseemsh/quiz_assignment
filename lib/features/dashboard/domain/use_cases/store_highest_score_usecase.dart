import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/highest_score_model.dart';

class StoreHighestScoreUsecase extends UseCase<HighestScoreModel, HighestScoreModel> {
  DashboardRepository repository;
  StoreHighestScoreUsecase(this.repository);

  @override
  Future<Either<Failure, HighestScoreModel>> call(
      HighestScoreModel params) async {
    return await repository.storeHighestScore(params);
  }
}
