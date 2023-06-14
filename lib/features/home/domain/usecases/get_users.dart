import 'package:airretailer_task/features/home/domain/entities/user_profile.dart';
import 'package:airretailer_task/features/home/domain/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class GetUsersProfileUseCase {
  final BaseUsersRepository repository;

  GetUsersProfileUseCase(this.repository);

  Future<Either<Failure, List<UserProfile>>> call() async {
    return await repository.getUsers();
  }
}
