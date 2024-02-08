// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/profile/domain/repositories/added_items_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserUsecase {
  final AddedItemsRepository repository;
  GetUserUsecase(this.repository);
  Future<Either<Failure, List<UserEntity>>> call() async {
    return await repository.getCurrentUser();
  }
}
