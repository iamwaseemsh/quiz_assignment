import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:quiz_assingments/core/utils/db/app_database.dart';
import 'package:quiz_assingments/features/dashboard/data/data_sources/dashboard_local_data_source.dart';
import 'package:quiz_assingments/features/dashboard/data/repositories/dashboard_repo_imp.dart';
import 'package:quiz_assingments/features/dashboard/domain/repositories/dashboard_repository.dart';
import 'package:quiz_assingments/features/dashboard/domain/use_cases/get_highest_score_usecase.dart';
import 'package:quiz_assingments/features/dashboard/domain/use_cases/store_highest_score_usecase.dart';
import 'package:quiz_assingments/features/dashboard/presentation/manager/dashboard_view_model.dart';
import 'package:quiz_assingments/features/quiz/data/data_sources/quiz_remote_data_source.dart';
import 'package:quiz_assingments/features/quiz/data/repositories/quiz_repo_imp.dart';
import 'package:quiz_assingments/features/quiz/domain/repositories/quiz_repository.dart';
import 'package:quiz_assingments/features/quiz/domain/use_cases/get_questions_usecase.dart';
import 'package:quiz_assingments/features/quiz/presentation/manager/quiz_view_model.dart';
import 'package:quiz_assingments/features/splash/data/data_sources/splash_local_data_source.dart';
import 'package:quiz_assingments/features/splash/data/data_sources/splash_remote_data_souce.dart';
import 'package:quiz_assingments/features/splash/data/repository/splash_repo_imp.dart';
import 'package:quiz_assingments/features/splash/domain/repository/splash_repository.dart';
import 'package:quiz_assingments/features/splash/domain/use_cases/get_custom_theme_usecase.dart';

import 'core/router/app_state.dart';
import 'core/utils/globals/globals.dart';
import 'core/utils/network/network_info.dart';
import 'package:dio/dio.dart';

import 'features/splash/presentation/manager/splash_view_model.dart';

Future<void> init() async {
  /// UseCases
  sl.registerLazySingleton(() => GetCustomThemeUsecase(sl()));
  sl.registerLazySingleton(() => StoreHighestScoreUsecase(sl()));
  sl.registerLazySingleton(() => GetHighestScoreUsecase(sl()));
  sl.registerLazySingleton(() => GetQuestionsUsecase(sl()));

  //Repositories
  sl.registerLazySingleton<QuizRepository>(
      () => QuizRepoImp(remoteDataSource: sl(), networkInfo: sl()));

  sl.registerLazySingleton<DashboardRepository>(
      () => DashboardRepoImp(localDataSource: sl()));

  sl.registerLazySingleton<SplashRepository>(
      () => SplashRepoImp(networkInfo: sl(), remoteDataSource: sl()));

  //Data sources
  sl.registerLazySingleton<SplashRemoteDataSource>(
      () => SplashRemoteDataSourceImp(dio: sl()));

  sl.registerLazySingleton<QuizRemoteDataSource>(
      () => QuizRemoteDataSourceImp(dio: sl()));

  sl.registerLazySingleton<SplashLocalDataSource>(
      () => SplashLocalDataSourceImp());

  sl.registerLazySingleton<DashboardLocalDataSource>(
      () => DashboardLocalDataSourceImp(appDatabase: sl()));

  /// Configs

  /// Repository

  /// External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => AppDatabase());

  /// Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// ViewModels
  ///
  sl.registerLazySingleton(() => DashboardViewModel(
      storeHighestScoreUsecase: sl(), getHighestScoreUsecase: sl()));
  sl.registerLazySingleton(() => QuizViewModel(getQuestionsUsecase: sl()));
  sl.registerLazySingleton(() => SplashViewModel(getCustomThemeUsecase: sl()));

  /// Navigator
  sl.registerLazySingleton(() => AppState());
}
