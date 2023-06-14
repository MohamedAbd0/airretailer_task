import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/error/failure.dart';
import '../../domain/repository/base_users_repository.dart';
import '../data_source/auth_remote_data_source.dart';

class AuthRepository implements BaseAuthRepository {
  final BaseAuthRemoteDataSource remoteDataSource;
  AuthRepository(
    this.remoteDataSource,
  );

  @override
  Future<Either<Failure, bool>> login(
      {required String email, required String password}) async {
    try {
      await remoteDataSource.login(
        email: email,
        password: password,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return const Left(ServerFailure("No user found for that email."));
      } else if (e.code == 'wrong-password') {
        return const Left(
            ServerFailure("Wrong password provided for that user."));
      } else {
        return Left(ServerFailure(e.code));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> register({
    required String email,
    required String password,
    required String name,
    required String gender,
  }) async {
    try {
      await remoteDataSource.register(
        email: email,
        password: password,
        name: name,
        gender: gender,
      );
      return const Right(true);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return const Left(ServerFailure("The password provided is too weak."));
      } else if (e.code == 'email-already-in-use') {
        return const Left(
            ServerFailure("he account already exists for that email."));
      } else {
        return Left(ServerFailure(e.code));
      }
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
