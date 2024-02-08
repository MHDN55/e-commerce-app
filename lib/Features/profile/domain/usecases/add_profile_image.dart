import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/profile/domain/repositories/added_items_repositories.dart';
import 'package:e_commerce_app/core/error/failures.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProfileImageUsecase {
  final AddedItemsRepository repository;
  AddProfileImageUsecase(this.repository);
  Future<Either<Failure, String>> call(File file, String imageName) async {
    return await repository.addProfileImage(file,imageName);
  }
}
