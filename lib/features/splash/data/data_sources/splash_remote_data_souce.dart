import 'dart:async';

import 'package:dio/dio.dart';
import 'package:quiz_assingments/core/modals/no_params.dart';
import 'package:quiz_assingments/features/splash/data/modals/custom_theme_model.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/error_response_model.dart';
import '../../../../core/utils/constants/app_messages.dart';
import '../../../../core/utils/constants/app_url.dart';

abstract class SplashRemoteDataSource {
  /// This method gets theme data from API
  /// [Input]: [NoParams] contains nothing
  /// [Output] : if operation successful returns [GetCustomThemeResponseModel] returns app theme variables info
  /// if unsuccessful the response will be [Failure]
  Future<GetCustomThemeResponseModel> getCustomTheme(NoParams params);
}

class SplashRemoteDataSourceImp implements SplashRemoteDataSource {
  Dio dio;
  SplashRemoteDataSourceImp({required this.dio});
  @override
  Future<GetCustomThemeResponseModel> getCustomTheme(NoParams params) async {
    String url = AppUrl.baseUrl + AppUrl.getThemeUrl;

    try {
      final response = await dio.get(url);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return GetCustomThemeResponseModel.fromJson(response.data[0]);
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
