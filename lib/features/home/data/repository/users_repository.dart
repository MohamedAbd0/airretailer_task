import 'package:airretailer_task/features/home/data/data_source/users_local_data_source.dart';
import 'package:airretailer_task/features/home/data/model/user_profile_model.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/base_users_repository.dart';

class UsersRepository implements BaseUsersRepository {
  final BaseUsersLocalDataSource localDataSource;
  UsersRepository(
    this.localDataSource,
  );

  @override
  Future<Either<Failure, List<UserProfileModel>>> getUsers() async {
    final result = await localDataSource.getUsers();
    try {
      return Right(result);
    } catch (failure) {
      return Left(ServerFailure(failure.toString()));
    }
  }
}
