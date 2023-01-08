import 'package:dio/dio.dart';
import 'package:quiz_assingments/features/quiz/data/data_sources/quiz_remote_data_source.dart';
import 'package:quiz_assingments/features/quiz/domain/repositories/quiz_repository.dart';

import '../../../../core/utils/network/network_info.dart';

class QuizRepoImp implements QuizRepository {
  QuizRemoteDataSource quizRemoteDataSource;
  final NetworkInfo networkInfo;

  QuizRepoImp({required this.quizRemoteDataSource, required this.networkInfo});
}
