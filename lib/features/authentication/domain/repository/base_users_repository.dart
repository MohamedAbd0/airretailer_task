import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

abstract class BaseAuthRepository {
  Future<Either<Failure, bool>> login(
      {required String email, required String password});
  Future<Either<Failure, bool>> register({
    required String email,
    required String password,
    required String name,
    required String gender,
  });
}
