import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../splash/data/modals/custom_theme_model.dart';
import '../../data/models/highest_score_model.dart';

abstract class DashboardRepository {
  /// This method gets highest score
  /// [Input]: [NoParams] contains no data
  /// [Output] : if operation successful returns [HighestScoreModel] returns the highest score
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, HighestScoreModel>> getHighestScore(NoParams params);
  /// This method gets highest score
  /// [Input]: [HighestScoreModel] contains user scored highest
  /// [Output] : if operation successful returns [HighestScoreModel] returns the highest score
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, HighestScoreModel>> storeHighestScore(HighestScoreModel params);
}
