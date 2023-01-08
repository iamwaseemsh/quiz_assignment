import 'package:dio/dio.dart';
import 'package:quiz_assingments/core/utils/db/app_database.dart';
import 'package:quiz_assingments/features/dashboard/data/models/highest_score_model.dart';
import 'package:sembast/sembast.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/modals/no_params.dart';

abstract class DashboardLocalDataSource {
  Future<HighestScoreModel> getHighestScore(NoParams params);
  Future<HighestScoreModel> storeHighestScore(HighestScoreModel params);
}

class DashboardLocalDataSourceImp implements DashboardLocalDataSource {
  AppDatabase appDatabase;
  DashboardLocalDataSourceImp({required this.appDatabase});
  Future<Database> get _db async => await AppDatabase().database;

  @override
  Future<HighestScoreModel> getHighestScore(NoParams params) async {
    try {
      var store = StoreRef.main();

      final db = await _db;

      var score = await store.record('score').get(db) as int;
      return HighestScoreModel(score);
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }

  @override
  Future<HighestScoreModel> storeHighestScore(HighestScoreModel params) async {
    try {
      var store = StoreRef.main();

      final db = await _db;
      await store.record('score').put(db, params.value);

      return HighestScoreModel(params.value);
    } catch (e) {
      throw SomethingWentWrong(e.toString());
    }
  }
}
