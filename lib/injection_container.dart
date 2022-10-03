import 'package:get_it/get_it.dart';
import 'package:hot_reddit/features/account/data/repositories/account_repository.dart';
import 'package:hot_reddit/features/account/domain/use_cases/authorize_use_case.dart';
import 'package:hot_reddit/features/posts/data/remote/data_sources/posts_remote_data_source.dart';
import 'package:hot_reddit/features/posts/data/repositories/posts_repository.dart';

import 'core/app/state/appstate.dart';
import 'core/navigation_service.dart';
import 'features/account/data/remote/data_sources/account_remote_data_source.dart';
import 'features/posts/domain/use_cases/posts_use_case.dart';
// import 'features/wizard/presentation/blocs/wizard_bloc.dart';

final sl = GetIt.instance;

void initInjection() {
  sl.registerLazySingleton(() => AppStateModel());

  // navigation
  sl.registerLazySingleton(() => NavigationService());

  //! use cases
  sl.registerLazySingleton(() => PostsUseCase(sl()));
  sl.registerLazySingleton(() => AuthorizeUseCase(sl()));


  //! repos
  sl.registerLazySingleton(() => PostsRepository(sl()));
  sl.registerLazySingleton(() => AccountRepository(sl()));


  //! data sources
  sl.registerLazySingleton(() => PostsRemoteDataSource());
  sl.registerLazySingleton(() => AccountRemoteDataSource());


  //! Core



  //! External

}
