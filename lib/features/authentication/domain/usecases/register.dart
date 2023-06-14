import 'package:airretailer_task/features/authentication/domain/repository/base_users_repository.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';

class RegisterUseCase {
  final BaseAuthRepository repository;

  RegisterUseCase(this.repository);

  Future<Either<Failure, void>> call({
    required String email,
    required String password,
    required String name,
    required String gender,
  }) async {
    return await repository.register(
      name: name,
      email: email,
      gender: gender,
      password: password,
    );
  }
}
