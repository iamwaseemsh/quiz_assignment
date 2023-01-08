import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../splash/data/modals/custom_theme_model.dart';
import '../../data/models/highest_score_model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, HighestScoreModel>> getHighestScore(NoParams params);
  Future<Either<Failure, HighestScoreModel>> storeHighestScore(HighestScoreModel params);
}
