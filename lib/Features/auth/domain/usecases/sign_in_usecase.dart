import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/auth/domain/repositories/user_repository.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SignInUseCase {
  final UserRepository repository;

  SignInUseCase({required this.repository});

  Future<Either<Failure, Unit>> call(UserEntity user) async {
    return await repository.signIn(user);
  }
}
