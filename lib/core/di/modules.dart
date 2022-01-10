import 'package:e_shop_flutter/core/data/app_settings.dart';
import 'package:e_shop_flutter/core/data/local/database.dart';
import 'package:e_shop_flutter/core/data/local/interactors/purchase_interactor.dart';
import 'package:e_shop_flutter/core/data/local/repositories/items_repository.dart';
import 'package:e_shop_flutter/core/data/local/repositories/purchase_repository.dart';
import 'package:e_shop_flutter/ui/add_purchase/logic/addpurchase_cubit.dart';
import 'package:e_shop_flutter/ui/main/logic/main_cubit.dart';
import 'package:e_shop_flutter/ui/purchase/logic/purchase_cubit.dart';
import 'package:e_shop_flutter/ui/purchases/logic/purchases_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setUp() {
  getIt.registerSingletonAsync(() => SharedPreferences.getInstance());
  getIt.registerLazySingleton(() => AppSettings(getIt.get()));

  _localDatabaseModule();
  _interactorsModule();
  _registerCubits();
}

void _localDatabaseModule() {
  getIt.registerSingletonAsync(() => Future.value(LocalDatabase()));

  getIt.registerLazySingleton(
    () => ItemsRepository(getIt.get<LocalDatabase>().itemsDao),
  );

  getIt.registerLazySingleton(
    () => PurchaseRepository(getIt.get<LocalDatabase>().purchaseDao),
  );
}

void _interactorsModule() {
  getIt.registerFactory(
    () => PurchaseInteractor(
      purchaseRepository: getIt.get(),
      itemsRepository: getIt.get(),
    ),
  );
}

void _registerCubits() {
  // MainCubit
  getIt.registerLazySingleton(() => MainCubit(getIt.get()));

  // PurchaseCubit
  getIt.registerFactory(() => PurchaseCubit(getIt.get()));

  // PurchasesCubit
  getIt.registerFactory(
    () => PurchasesCubit(
      purchaseInteractor: getIt.get(),
      mainCubit: getIt.get(),
    ),
  );

  // AddPurchaseCubit
  getIt.registerFactory(
    () => AddPurchaseCubit(
      purchaseInteractor: getIt.get(),
      mainCubit: getIt.get(),
    ),
  );
}
