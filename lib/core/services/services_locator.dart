import 'package:airretailer_task/features/authentication/data/data_source/auth_remote_data_source.dart';
import 'package:airretailer_task/features/authentication/data/repository/auth_repository.dart';
import 'package:airretailer_task/features/authentication/domain/repository/base_users_repository.dart';
import 'package:airretailer_task/features/authentication/domain/usecases/login.dart';
import 'package:airretailer_task/features/authentication/domain/usecases/register.dart';
import 'package:airretailer_task/features/authentication/presentaion/provider/auth.dart';
import 'package:airretailer_task/features/home/data/data_source/users_local_data_source.dart';
import 'package:airretailer_task/features/home/data/repository/users_repository.dart';
import 'package:airretailer_task/features/home/domain/repository/base_users_repository.dart';
import 'package:airretailer_task/features/home/domain/usecases/get_users.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/presentaion/provider/users.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// privider
    sl.registerFactory(() => UsersController(sl()));
    sl.registerFactory(() => AuthController(sl(), sl()));

    /// Use Cases
    sl.registerLazySingleton(() => GetUsersProfileUseCase(sl()));
    sl.registerLazySingleton(() => LoginUseCase(sl()));
    sl.registerLazySingleton(() => RegisterUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<BaseUsersRepository>(() => UsersRepository(sl()));
    sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepository(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<BaseUsersLocalDataSource>(
        () => UsersLocalDataSource());
    sl.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
  }
}
