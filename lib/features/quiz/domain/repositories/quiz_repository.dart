import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';

abstract class QuizRepository {
  /// This method get list of Questions from quiz api
  /// [Input]: [NoParams] contains nothing
  /// [Output] : if operation successful returns List of[QuestionModel] returns questions
  /// if unsuccessful the response will be [Failure]
  Future<Either<Failure, List<QuestionModel>>> getQuestionsList(NoParams params);
}
