import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:quiz_assingments/features/quiz/data/data_sources/quiz_remote_data_source.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';
import 'package:quiz_assingments/features/quiz/domain/repositories/quiz_repository.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/network/network_info.dart';
import '../../../dashboard/data/models/highest_score_model.dart';

class QuizRepoImp implements QuizRepository {
  QuizRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  QuizRepoImp({required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<QuestionModel>>> getQuestionsList(
      NoParams params) async {

    try {
      return Right(await remoteDataSource.getQuestionsList(params));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(ServerFailure(e));
    }
  }

}
