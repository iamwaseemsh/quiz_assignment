import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';

abstract class QuizRepository {
  Future<Either<Failure, List<QuestionModel>>> getQuestionsList(NoParams params);
}
