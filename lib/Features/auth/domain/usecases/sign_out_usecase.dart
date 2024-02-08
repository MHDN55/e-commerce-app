import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/domain/repositories/user_repository.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignOutUseCase {
  final UserRepository repository;

  SignOutUseCase({required this.repository});

  Future<Either<Failure, Unit>> call() async {
    return await repository.signOut();
  }
}
