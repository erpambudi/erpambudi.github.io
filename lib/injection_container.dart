import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/bloc/locale/locale_cubit.dart';
import 'core/bloc/theme/theme_cubit.dart';
import 'features/portfolio/data/datasources/portfolio_local_data_source.dart';
import 'features/portfolio/data/repositories/portfolio_repository_impl.dart';
import 'features/portfolio/domain/repositories/portfolio_repository.dart';
import 'features/portfolio/presentation/cubit/portfolio_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // 1. External Dependencies
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  // 2. Data Sources
  sl.registerLazySingleton<PortfolioLocalDataSource>(
    () => PortfolioLocalDataSourceImpl(),
  );

  // 3. Repositories
  sl.registerLazySingleton<PortfolioRepository>(
    () => PortfolioRepositoryImpl(localDataSource: sl()),
  );

  // 4. Cubits
  sl.registerFactory(() => PortfolioCubit(repository: sl()));
  sl.registerLazySingleton(() => LocaleCubit(prefs: sl()));
  sl.registerLazySingleton(() => ThemeCubit(prefs: sl()));
}
