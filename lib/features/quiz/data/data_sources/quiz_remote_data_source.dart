import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quiz_assingments/features/quiz/data/models/question_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/modals/no_params.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';

abstract class QuizRemoteDataSource {
  Future<List<QuestionModel>> getQuestionsList(NoParams params);
}

class QuizRemoteDataSourceImp implements QuizRemoteDataSource {
  Dio dio;
  QuizRemoteDataSourceImp({required this.dio});
  @override
  Future<List<QuestionModel>> getQuestionsList(NoParams params) async {
    String url = AppUrl.baseUrl + AppUrl.getQuestionsUrl;

    try {
      final response = await dio.get(url);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data
            .map<QuestionModel>((item) => QuestionModel.fromJson(item))
            .toList();
      }
      throw const SomethingWentWrong(AppMessages.somethingWentWrong);
    } on DioError catch (exception) {
      if (exception.type == DioErrorType.connectTimeout) {
        throw TimeoutException(AppMessages.timeOut);
      } else {
        ErrorResponseModel errorResponseModel =
            ErrorResponseModel.fromJson(exception.response?.data);
        throw SomethingWentWrong(errorResponseModel.msg);
      }
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
