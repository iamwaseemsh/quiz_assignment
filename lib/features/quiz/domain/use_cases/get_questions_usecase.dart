import 'package:dartz/dartz.dart';
import 'package:quiz_assingments/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';
import 'package:quiz_assingments/features/quiz/domain/repositories/quiz_repository.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/usecases/usecase.dart';

class GetQuestionsUsecase extends UseCase<List<QuestionModel>, NoParams> {
  QuizRepository repository;
  GetQuestionsUsecase(this.repository);

  @override
  Future<Either<Failure, List<QuestionModel>>> call(NoParams params) async {
    return await repository.getQuestionsList(params);
  }
}
