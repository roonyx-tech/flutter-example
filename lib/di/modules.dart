import 'package:e_shop_flutter/data/app_settings.dart';
import 'package:e_shop_flutter/data/local/database.dart';
import 'package:e_shop_flutter/data/local/repositories/purchase_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  getIt.registerSingletonWithDependencies<AppSettings>(() => AppSettings(),
      dependsOn: [SharedPreferences]);
  getIt.registerSingleton<MyDatabase>(MyDatabase());
  getIt.registerSingleton<PurchaseRepository>(PurchaseRepository());
}
