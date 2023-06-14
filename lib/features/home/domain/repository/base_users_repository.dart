import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/user_profile.dart';

abstract class BaseUsersRepository {
  Future<Either<Failure, List<UserProfile>>> getUsers();
}
