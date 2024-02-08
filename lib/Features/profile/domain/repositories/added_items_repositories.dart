
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Features/auth/domain/entities/user_entity.dart';
import 'package:e_commerce_app/Features/profile/domain/entities/order_list_entity.dart';
import 'package:e_commerce_app/core/error/failures.dart';

abstract class AddedItemsRepository {
  // Future<Either<Failure, List<AddedItemsEntity>>> getAddedItems();
  Future<Either<Failure, List<OrdersListEntity>>> getAddedOrders();
  Future<Either<Failure, List<UserEntity>>> getCurrentUser();
  Future<Either<Failure, String>> addProfileImage(File file, String imageName);
}
