import 'package:airretailer_task/features/authentication/domain/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class LoginUseCase {
  final BaseAuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, void>> call(
      {required String email, required String password}) async {
    return await repository.login(email: email, password: password);
  }
}
