import 'package:get_it/get_it.dart';
import 'package:flutter_start_mvvm/_services/auth_service.dart';
import 'package:flutter_start_mvvm/_services/dialog_service.dart';
import 'package:flutter_start_mvvm/_services/navigation_service.dart';
import 'package:flutter_start_mvvm/viewmodels/home_viewmodel.dart';
import 'package:flutter_start_mvvm/viewmodels/login_viewmodel.dart';
import '_services/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => Api());
  locator.registerLazySingleton(() => AuthService());


  locator.registerFactory(() => LoginViewModel());
  locator.registerFactory(() => HomeViewModel());
}
