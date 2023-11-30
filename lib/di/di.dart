import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/config/constants.dart';

import 'di.config.dart';

final getIt = GetIt.instance;

@injectableInit
Future<void> configureDependencies() async {
  final preferences = await SharedPreferences.getInstance();
  getIt.registerFactory(() => preferences);

  getIt.init();
}

@module
abstract class DiModule {

  @singleton
  Dio get dio {
    final instance = Dio(BaseOptions(baseUrl: BASE_API_URL));
    return instance;
  }

}
