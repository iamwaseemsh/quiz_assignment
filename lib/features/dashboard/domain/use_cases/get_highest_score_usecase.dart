import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/dashboard/domain/repositories/dashboard_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';
import '../../data/models/highest_score_model.dart';

class GetHighestScoreUsecase extends UseCase<HighestScoreModel, NoParams> {
  DashboardRepository repository;
  GetHighestScoreUsecase(this.repository);

  @override
  Future<Either<Failure, HighestScoreModel>> call(NoParams params) async {
    return await repository.getHighestScore(params);
  }
}
